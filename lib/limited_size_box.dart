import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LimitedSizeBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类容器"),
      ),
      body: LimitedSizeBoxTest(),
    );
  }
}

class LimitedSizeBoxTest extends StatelessWidget {
  final Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 50.0, // 最小宽度为50
            minWidth: double.infinity, // 宽度尽可能大
          ),
          child: Container(
            height: 5.0,
            child: redBox,
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: redBox,
        ),
        // 多重限制
        // 父子组件中min限制项较大的有效
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), // 父组件
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子组件
            child: redBox,
          ),
        ),
        // 交换父子组件限制，仍是min数值较大的有效
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), // 父组件
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //子组件
            child: redBox,
          ),
        ),
        // 用UnconstrainedBox解除限制
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), // 父组件
          child: UnconstrainedBox(
            // 去除父组件限制
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              // 子组件
              child: redBox,
            ),
          ),
        ),
        // 装饰容器
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 40, minWidth: 80),
          child: DecoratedBoxTest(),
        ),
      ].map((e) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: e,
        );
      }).toList(),
    );
  }
}

// 装饰容器示例
class DecoratedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]), // 背景渐变
        borderRadius: BorderRadius.circular(3.0),  // 3像素圆角
        boxShadow: [  // 阴影，虽然看起来像按钮，但不能点击
          BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0 // 模糊?
              )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
