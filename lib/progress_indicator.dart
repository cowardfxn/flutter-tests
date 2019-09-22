import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度指示器"),
      ),
      body: Column(
        children: <Widget>[
          BasicProgressIndicators(),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("进阶样式"),
          ),
          ProgressTest(),
        ],
      ),
    );
  }
}

class BasicProgressIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("基础样式"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("线性指示器(固定进度)"),
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("线性指示器(模糊进度) "),
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("环形指示器(固定进度) "),
            ),
            SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .4,
                )),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("环形指示器(模糊进度) "),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProgressTest extends StatefulWidget {
  @override
  _ProgressTestState createState() => new _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // 动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              // 从灰色变成蓝色
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController),
              value: _animationController.value,
            ),
          ),
          RaisedButton(
            child: Text("重置进度"),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // TODO: rerun progress not working
              _animationController.resync(this);
            },
          )
        ],
      ),
    );
  }
}
