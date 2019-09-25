import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowLayoutTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Column(
        children: <Widget>[WrapTest(), FlowTest()],
      ),
    );
  }
}

class WrapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.center,
      children: <Widget>[
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("A"),
          ),
          label: new Text("Hamilton"),
        ),
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("M"),
          ),
          label: new Text("Lafayette"),
        ),
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("H"),
          ),
          label: new Text("Mulligan"),
        ),
        new Chip(
          avatar: new CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("J"),
          ),
          label: new Text("Lanrens"),
        ),
      ],
    );
  }
}

class FlowTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    // 计算每个子Widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      // 如果水平方向未到达屏幕边界，不需要换行
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        // 移动x坐标
        x = w + margin.left;
      } else {
        // 如果水平方向达到屏幕边界，换行
        // x回归初始值
        x = margin.left;
        // y 换行
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        // 绘制子Widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        // 移动x坐标
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    // 指定flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
