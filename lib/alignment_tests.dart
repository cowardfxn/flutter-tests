import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignmentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("对齐与相对定位"),),
      body: Column(
        children: <Widget>[
          AlignTest1(),
          AlignTest2(),
          FractionalTest(),
        ].map((w) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: w,
            );
        }).toList(),
      ),
    );
  }
}

class AlignTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

class AlignTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: Alignment(2, 0.0),  // 水平方向位移2
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

class FractionalTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: FractionalOffset(0.2, 0.6),  // 整个父Widget宽高为1
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}