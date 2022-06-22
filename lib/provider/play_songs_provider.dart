import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/api/music_api.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/models/song_model.dart';
import 'package:netease_cloud_music/utils/fluro_convert_utils.dart';

class PlaySongsProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState? _audioPlayerState;
  Duration? _position;
  Duration? _duration;
  PlayerState? _playerState;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get isPlaying => _playerState == PlayerState.playing;

  bool get isPaused => _playerState == PlayerState.paused;

  String get durationText => _duration?.toString().split('.').first ?? '';

  String get positionText => _position?.toString().split('.').first ?? '';

  ///  _position != null ? '$_positionText / $_durationText' : _duration != null ? _durationText : ''

  List<SongModel> _songs = [];
  int curIndex = 0;

  List<SongModel> get allSongs => _songs;

  SongModel get curSong => _songs[curIndex];

  AudioPlayer get player => _audioPlayer;

  PlayerState? get state => _playerState;

  void init() {
    // _audioPlayer.setReleaseMode(ReleaseMode.stop);
    _durationSubscription =
        _audioPlayer.onDurationChanged.listen((Duration duration) {
      print('Current duration: $duration');
      _duration = duration;
    });

    /// 当前播放进度监听
    _positionSubscription =
        _audioPlayer.onPositionChanged.listen((Duration position) {
      _position = position;
      // print('Current position: $position');
    });
    _playerStateChangeSubscription =
        _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      _audioPlayerState = state;
      print('Current state: $state');
      // if (state == PlayerState.completed) {
      //   nextPlay();
      //   notifyListeners();
      // }
      notifyListeners();
    });
    _playerCompleteSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      player.stop();
      _playerState = PlayerState.stopped;
      _position = _duration;
      print('Player complete!');
    });
  }

  /// 播放一首歌
  Future<void> playSong(SongModel song) async {
    _songs.insert(curIndex, song);
    var songId = song.id;
    var url = await MusicApi.getMusicUrl(songId);
    // print(url);
    // var url = 'http://m7.music.126.net/20220614111929/4550f3670921d199adbbaf86dd04f419/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3';
    // var url = 'https://music.163.com/song/media/outer/url?id=$songId.mp3';
    // var url = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
    // _audioPlayer.setSourceUrl(url);
    if(url != null){
      _audioPlayer.setSource(UrlSource(url));
      saveSong();
      play();
    }
  }

  /// 播放很多歌
  Future<void> playSongs(List<SongModel> songs, {int? index}) async {
    _songs = songs;
    if (index != null) {
      curIndex = index;
    }
    var songId = _songs[curIndex].id;
    // var url = await MusicApi.getMusicUrl(songId);
    // print(url);
    var url = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
    // var url = 'http://m7.music.126.net/20220614111929/4550f3670921d199adbbaf86dd04f419/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3';
    // var url = 'https://music.163.com/song/media/outer/url?id=33894312.mp3';
    // var url = 'https://music.163.com/song/media/outer/url?id=$songId.mp3';
    if(url != null){
      _audioPlayer.setSource(UrlSource(url));
      saveSong();
      // play();
    }
  }

  /// 添加歌曲
  void addSongs(List<SongModel> songs) {
    _songs.addAll(songs);
  }

  /// 播放
  Future<void> play() async {
    final position = _position;
    if (position != null && position.inMilliseconds > 0) {
      await player.seek(position);
    }
    await player.resume();
    _playerState = PlayerState.playing;
  }

  /// 暂停、恢复
  void togglePlay() {
    if (_audioPlayer.state == PlayerState.paused) {
      resume();
    } else {
      pause();
    }
  }

  /// 暂停
  Future<void> pause() async {
    await _audioPlayer.pause();
    _playerState = PlayerState.paused;
  }

  /// 恢复播放
  Future<void> resume() async {
    await _audioPlayer.resume();
    _playerState = PlayerState.playing;
  }

  /// 跳转到固定时间
  Future<void> seekPlay(int milliseconds) async {
    await _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resume();
  }

  /// 下一首
  void nextPlay() {
    if (curIndex >= _songs.length) {
      curIndex = 0;
    } else {
      curIndex++;
    }
    play();
  }

  /// 上一首
  void prePlay() {
    if (curIndex <= 0) {
      curIndex = _songs.length - 1;
    } else {
      curIndex--;
    }
    play();
  }

  /// 保存当前歌曲到本地
  void saveSong() {
    Application.sp?.remove('playing_song_list');
    Application.sp?.setStringList('playing_song_list',
        _songs.map((s) => FluroConvertUtils.object2string(s)).toList());
    Application.sp?.setInt('playing_index', curIndex);
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }
}
