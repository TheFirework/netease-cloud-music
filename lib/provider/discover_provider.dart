import 'package:flutter/foundation.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';

class DiscoverProvider with ChangeNotifier {
  Resources? _resources;

  String? get title => _resources?.uiElement.mainTitle?.title;

  void setResources(value) {
    _resources = value;
    notifyListeners();
  }
}
