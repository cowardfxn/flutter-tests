import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedWidgetTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("跨WIdget数据共享"),),
      body: InheritedWidgetTest(),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child
  }): super(child: child);

  final int data;  // 需要在子树中共享的数据

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    // 如果返回true，则子树中的依赖(build函数中有调用)本widget
    // 的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => new _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
    // 如果不引用ShareDataWidget，则ShareDataWidget.updateShouldNotify不会影响该Widget
    // return Text("AAAA");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先Widget中的InheritedWidget改变(updateShouldNotify返回true)时
    // 会被调用。如果build中没有依赖InheritedWidget，则此回调不会被调用
    print("Dependencies changed");
  }
}

class InheritedWidgetTest extends StatefulWidget {
  @override
  _InheritedWidgetTestState createState() => new _InheritedWidgetTestState();
}

class _InheritedWidgetTestState extends State<InheritedWidgetTest> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),  // 子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("增加"),
              // 每点击一次，count将自增，然后重新build，ShareDataWidget的
              // data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}