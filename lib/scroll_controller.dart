import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动监听及控制"),),
      body: ScrollNotificationTest(),
    );
  }
}

class ScrollNotificationTest extends StatefulWidget {
  @override
  _ScrollNotificationTestState createState() =>
      new _ScrollNotificationTestState();
}

class _ScrollNotificationTestState
    extends State<ScrollNotificationTest> {
  String _progreee = "0%"; //  保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      // 进度条
      // 监听滚动统治
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          // 重新构建
          setState(() {
            _progreee = "${(progress * 100).toInt()}%";
          });
          print(
              "BottomEdge: ${notification.metrics.extentAfter == 0}"); // print是否到底
          return false; // 放开此行注释后，进度条将失效，改为return false; 显示进度条
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
            ),
            CircleAvatar(
              // 显示进度百分比
              radius: 30.0,
              child: Text(_progreee),
              backgroundColor: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
