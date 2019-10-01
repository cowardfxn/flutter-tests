import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      // 显示进度条
      // 一次性载入所有数据，不支持Silver延迟加载
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: str
                .split("")
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0, // 字体放大为原来的两倍
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
