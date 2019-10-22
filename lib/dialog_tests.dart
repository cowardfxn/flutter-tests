import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

final DialogBoxRoute = () => getScaffold("对话框", DialogBoxTests());

class DialogBoxTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("对话框1"),
          onPressed: () async {
            // 弹出对话框并等待其关闭
            bool delete = await showDeleteConfirmDialog1(context);
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确认删除");
              // ... 删除文件
            }
          },
        ),
        RaisedButton(
          child: Text("对话框2"),
          onPressed: () async {
            return changeLanguage(context);
          },
        ),
        RaisedButton(
          child: Text("列表项对话框"),
          onPressed: () {
            return showListDialog(context);
          },
        ),
        RaisedButton(
          child: Text("自定义对话框"),
          onPressed: () {
            return showCustomDialog1(context);
          },
        ),
        RaisedButton(
          child: Text("话框3（复选框可点击）"),
          onPressed: () async {
            //弹出删除对话框，等待用户确认
            bool deleteTree = await showDeleteConfirmDialog3(context);
            if (deleteTree == null) {
              print("取消删除");
            } else {
              print("同时删除子目录：$deleteTree");
            }
          },
        ),
        RaisedButton(
          child: Text("话框4（复选框可点击）"),
          onPressed: () async {
            //弹出删除对话框，等待用户确认
            bool deleteTree = await showDeleteConfirmDialog4(context);
            if (deleteTree == null) {
              print("取消删除");
            } else {
              print("同时删除子目录：$deleteTree");
            }
          },
        ),
        RaisedButton(
          child: Text("显示底部菜单列表"),
          onPressed: () async {
            int type = await _showModalBottomSheet(context);
            print(type);
          },
        ),
        RaisedButton(
          child: Text("显示全屏底部菜单列表"),
          onPressed: () async {
            await _showBottomSheet(context);
          },
        ),
        RaisedButton(
          child: Text("显示加载框"),
          onPressed: () async {
            await showLoadingDialog(context);
          },
        ),
        RaisedButton(
          child: Text("Material风格日历选择器"),
          onPressed: () async {
            DateTime selDate = await _showDatePicker1(context);
            print(selDate);
          },
        ),
        RaisedButton(
          child: Text("iOS风格日历选择器"),
          onPressed: () async {
            DateTime selDate = await _showDatePicker2(context);
            print(selDate);
          },
        ),
      ].map((e) {
        return Padding(
          padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
          child: e,
        );
      }).toList(),
    );
  }
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // ...执行删除操作
                Navigator.of(context).pop(true); // 关闭对话框
              },
            ),
          ],
        );
      });
}

Future<void> changeLanguage(BuildContext context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("中文简体"),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: const Text("美国英语"),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? '中文简体' : '美国英语'}");
  }
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(
              title: Text("请选择"),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  }),
            )
          ],
        );

        return Dialog(
          child: child,
        );
      });

  if (index != null) {
    print("点击了：$index");
  }
}

// 自定义对话框遮罩
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
      Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder,);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null ?
            Theme(data: theme, child: pageChild,) : pageChild;
        },),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.cyanAccent.withAlpha(120),  // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child
) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<void> showCustomDialog1(BuildContext context) {
  return showCustomDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确认要删除当前文件吗？"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      );
    },
  );
}

class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
});
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxStata createState() => new _DialogCheckboxStata();
}

class _DialogCheckboxStata extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        // 将选中状态通过事件的形式传出
        widget.onChanged(v);
        // 更新自身选中状态
        setState(() {
          value = v;
        });
      },
    );
  }
}

Future<bool> showDeleteConfirmDialog3(BuildContext context) {
  bool _withTree = false;  // 记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗？"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree,  // 默认不选中
                  onChanged: (bool value) {
                    // 更新选中状态
                    _withTree = !_withTree;
                  },
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            // 返回选中状态
            onPressed: () => Navigator.of(context).pop(_withTree),
          )
        ],
      );
    },
  );
}

Future<bool> showDeleteConfirmDialog4(BuildContext context) {
  bool _withTree = false;
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗？"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                Checkbox(
                  value: _withTree,
                  onChanged: (bool value) {
                    // 将对话框UI对应的Element标记为dirty
                    (context as Element).markNeedsBuild();
                    _withTree = !_withTree;
                  },
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () => Navigator.of(context).pop(_withTree),
          )
        ],
      );
    },
  );
}

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    }
  );
}

// 从底部弹出全屏菜单列表
PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
  int count = 0;
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              count++;
              print("$index");
              // 选中5次后关闭菜单
              if (count > 4) {
                Navigator.of(context).pop();
              }
            },
          );
        },
      );
    }
  );
}

// 显示loading框
showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // 点击遮罩不关闭对话框
    builder: (BuildContext context) {
      return UnconstrainedBox(  // 去除原本组件大小限制
        constrainedAxis: Axis.vertical,
        child: SizedBox(  // 添加自定义宽度
          width: 300,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在加载，请稍后..."),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

// 日历选择器
Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(Duration(days: 60)), // 未来60天可选
  );
}

// iOS风格日历选择器
Future<DateTime> _showDatePicker2(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(Duration(days: 60)),
          maximumYear: date.year + 2,
          onDateTimeChanged: (DateTime value) {
            // value即为选中的日期
            print(value);
          },
        ),
      );
    }
  );
}