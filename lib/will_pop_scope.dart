import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("拦截返回按键"),),
      body: Center(
        child: WillPopScopeTest(),
      ),
    );
  }
}

class WillPopScopeTest extends StatefulWidget {
  @override
  WillPopScopeTestState createState() => new WillPopScopeTestState();
}

class WillPopScopeTestState extends State<WillPopScopeTest> {
  DateTime _lastPressedAt; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          // 两次点击的时间间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
    );
  }
}
