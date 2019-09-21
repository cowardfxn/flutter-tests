import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckboxRoute extends StatefulWidget {
  @override
  _SwitchAndCheckboxRouteState createState() =>
      new _SwitchAndCheckboxRouteState();
}

class _SwitchAndCheckboxRouteState extends State<SwitchAndCheckboxRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选按钮&复选框"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("单选按钮： "),
                Switch(
                    value: _switchSelected, // 当前状态
                    onChanged: (value) {
                      // 重新构建页面
                      setState(() {
                        _switchSelected = value;
                      });
                    }),
                Text(_switchSelected ? "开" : "关")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("复选框： "),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red, // 选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                Text(_checkboxSelected ? "选中" : "未选中")
              ],
            )
          ],
        ),
      ),
    );
  }
}
