import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color inputBoxColor = Color(0xffEDEDED);
    return Container(
      height: 30,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            size: 18,
            color: Color(0xffA9A9A9),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                child: Text(
                  "点击搜索",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                print('点击搜索框');
              },
            ),
          ),
        ],
      ),
    );
  }
}
