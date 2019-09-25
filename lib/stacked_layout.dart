import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackedLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: 400.0,
            height: 400.0,
            child: StackedTests1(),
          ),
          SizedBox(
            width: 400.0,
            height: 400.0,
            child: StackedTests2(),
          ),
        ],
      ),
    );
  }
}

class StackedTests1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, // 未定位或部分定位Widget对齐方式
        children: <Widget>[
          Container(
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}

class StackedTests2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, // 未定位Widget占满整个空间
        children: <Widget>[
          Container(
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
