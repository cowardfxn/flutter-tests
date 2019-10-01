import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ListView")),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("表名位"),
            ),
            Expanded(
              child: InfiniteListView(),
            ),
          ],
        ));
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          // 添加20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());

      // 重新绘制列表
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        // 如果到了表尾
        if (_words[index] == loadingTag) {
          // 如果不足100条，则继续获取数据
          if (_words.length - 1 < 100) {
            _retrieveData();
            // 显示圆形进度条
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
            );
          } else {
            // 已经加载100条，则不再获取数据
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        // 显示单词列表项
        return ListTile(
          title: Text(_words[index]),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: .0,
      ),
    );
  }
}
