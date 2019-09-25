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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
            children: <Widget>[
              FlatButton(
                child: Text("计数器"),
                textColor: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, "init_sample");
                },
              ),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, "new_page");
                },
              ),
              FlatButton(
                child: Text("Open new route with params"),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, "paramed_page");
                },
              ),
              FlatButton(
                child: Text("状态管理"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "state_management");
                },
              ),
              FlatButton(
                child: Text("文本&字体"),
                textColor: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(context, "text_page");
                },
              ),
              FlatButton(
                child: Text("按钮"),
                textColor: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(context, "button_page");
                },
              ),
              FlatButton(
                child: Text("图片&图标"),
                textColor: Colors.lightGreen,
                onPressed: () {
                  Navigator.pushNamed(context, "image_page");
                },
              ),
              FlatButton(
                child: Text("单选/复选"),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, "switch_chkbox_page");
                },
              ),
              FlatButton(
                child: Text("输入框和表单"),
                textColor: Colors.amber,
                onPressed: () {
                  Navigator.pushNamed(context, "textfield_form_page");
                },
              ),
              FlatButton(
                child: Text("进度指示器"),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "progress_indicator_page");
                },
              ),
              FlatButton(
                child: Text("线性布局"),
                textColor: Colors.cyan,
                onPressed: () {
                  Navigator.pushNamed(context, "linear_layout_page");
                },
              ),
              FlatButton(
                child: Text("弹性布局"),
                textColor: Colors.deepOrange,
                onPressed: () {
                  Navigator.pushNamed(context, "flex_layout_page");
                },
              ),
              FlatButton(
                child: Text("流式布局"),
                textColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.pushNamed(context, "flow_layout_page");
                },
              ),
              FlatButton(
                child: Text("层叠布局"),
                textColor: Colors.greenAccent,
                onPressed: () {
                  Navigator.pushNamed(context, "stacked_layout_page");
                },
              ),
              FlatButton(
                child: Text("对齐与相对位置"),
                textColor: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, "alignment_page");
                },
              ),
            ],
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

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
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
