import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: InfiniteGridView(),
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 每行三列
          childAspectRatio: 1.0, // 显示子元素宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if ((index == _icons.length - 1) && (_icons.length < 200)) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  @override
  void initState() {
    // 初始化数据
    super.initState();

    _retrieveIcons();
  }

  // 模拟异步获取数据
  _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
