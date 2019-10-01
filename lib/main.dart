import 'package:flutter/material.dart';
import 'package:flutter_book_app/textfield_and_form.dart';
import 'state_management.dart';
import 'text_and_font.dart';
import 'buttons.dart';
import 'image_and_icons.dart';
import 'switch_and_checkbox.dart';
import 'textfield_and_form.dart';
import 'progress_indicator.dart';
import 'linear_layout.dart';
import 'flex_layout.dart';
import 'flow_layout.dart';
import 'stacked_layout.dart';
import 'alignment_tests.dart';
import 'init_sample.dart';
import 'padding_test.dart';
import 'limited_size_box.dart';
import 'scaffold_tests.dart';
import 'clip_tests.dart';
import 'singlechildscrollview_test.dart';
import 'list_view.dart';
import 'grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
//        "/": (context) => MyHomePage(title: "Flutter Demo Home Page",),
        "init_sample": (context) => InitSampleRoute(),
        "new_page": (context) => NewRoute(),
        "paramed_page": (context) => RouterTextRoute(),
        "state_management": (context) => StateRoute(),
        "text_page": (context) => TextRoute(),
        "button_page": (context) => ButtonRoute(),
        "image_page": (context) => ImageAndIconRoute(),
        "switch_chkbox_page": (context) => SwitchAndCheckboxRoute(),
        "textfield_form_page": (context) => TextfieldAndFormRoute(),
        "progress_indicator_page": (context) => ProgressIndicatorRoute(),
        "linear_layout_page": (context) => LinearLayoutRoute(),
        "flex_layout_page": (context) => FlexLayoutRoute(),
        "flow_layout_page": (context) => FlowLayoutTests(),
        "stacked_layout_page": (context) => StackedLayoutRoute(),
        "alignment_page": (context) => AlignmentRoute(),
        "padding_page": (context) => PaddingTestRoute(),
        "limited_size_page": (context) => LimitedSizeBoxRoute(),
        "scaffold_page": (context) => ScaffoldRoute(),
        "clip_page": (context) => ClipTestRoute(),
        "singlechildscrollview_page": (context) => SingleChildScrollViewRoute(),
        "listview_page": (context) => ListViewRoute(),
        "gridview_page": (context) => GridViewRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <List>[
              ["计数器", Colors.amber, "init_sample"],
              ["新页面", Colors.red, "new_page"],
              ["带参数的新页面", Colors.green, "paramed_page"],
              ["状态管理", Colors.blue, "state_management"],
              ["文本&字体", Colors.teal, "text_page"],
              ["按钮", Colors.teal, "button_page"],
              ["图片&图标", Colors.lightGreen, "image_page"],
              ["单选/复选", Colors.green, "switch_chkbox_page"],
              ["输入框和表单", Colors.amber, "textfield_form_page"],
              ["进度指示器", Colors.black, "progress_indicator_page"],
              ["线性布局", Colors.cyan, "linear_layout_page"],
              ["弹性布局", Colors.deepOrange, "flex_layout_page"],
              ["流式布局", Colors.deepPurple, "flow_layout_page"],
              ["层叠布局", Colors.greenAccent, "stacked_layout_page"],
              ["对齐与相对位置", Colors.pink, "alignment_page"],
              ["填充", Colors.blue[400], "padding_page"],
              ["尺寸限制类容器", Colors.deepOrangeAccent[200], "limited_size_page"],
              ["脚手架", Colors.deepPurple[200], "scaffold_page"],
              ["裁剪", Colors.green[200], "clip_page"],
              ["单子节点滚动组件", Colors.green[200], "singlechildscrollview_page"],
              ["ListView", Colors.orangeAccent[100], "listview_page"],
              ["GridView", Colors.lime[500], "gridview_page"],
            ].map((params) {
              return FlatButton(
                child: Text(params[0]),
                textColor: params[1],
                onPressed: () {
                  Navigator.pushNamed(context, params[2]);
                },
              );
            }).toList(),
          ),
        ],
      )),
    );
  }
}

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New route'),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
            child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () => Navigator.pop(context, "这里是返回值"),
              child: Text("返回"),
            )
          ],
        )),
      ),
    );
  }
}

class RouterTextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TipRoute(
                text: "这里是提示003",
              );
            }),
          );
          print("路由返回值: $result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}

class StateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("状态管理"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
            child: Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: ParentWidget(),
            ),
            ParentWidgetC()
          ],
        )),
      ),
    );
  }
}

class TextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "文本&字体",
        )),
        body: Center(
          child: TextSamples(),
        ));
  }
}

class ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "按钮",
        )),
        body: Center(
          child: BasicButtons(),
        ));
  }
}
