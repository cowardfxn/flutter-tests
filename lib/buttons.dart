import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("RaisedButton "),
            RaisedButton(
              child: Text("normal"),
              onPressed: () {
                print("RaisedButton pressed");
              },
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text("FlatButton "),
            FlatButton(
              child: Text("normal"),
              onPressed: () {
                print("FlatButton pressed");
              },
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text("OutlineButton "),
            OutlineButton(
              child: Text("normal"),
              onPressed: () {
                print("OutlineButton pressed");
              },
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text("IconButton "),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                print("IconButton pressed");
              },
            )
          ],
        ),
        Text("带图标的按钮："),
        RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: () {
            print("Iconed RaisedButton pressed");
          },
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: () {
            print("Iconed OutlineButton pressed");
          },
        ),
        FlatButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: () {
            print("Iconed FlatButton pressed");
          },
        ),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          onPressed: () {print("No shadow button");},
        ),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit 2"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          onPressed: () {print("With shadow");},
        )
      ],
    );
  }
}
