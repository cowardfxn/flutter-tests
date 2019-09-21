import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        BasicTextSample(),
        TextStyleSample(),
        TextSpanSample(),
        DefaultTextStyleSample(),
      ],
    );
  }
}
class BasicTextSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Hello world", textAlign: TextAlign.left,),
        Text("Hello world! I'm Jack" * 4,
          maxLines: 1, overflow: TextOverflow.ellipsis,),
        Text("Hello world", textScaleFactor: 1.5,)
      ],
    );
  }
}

class TextStyleSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text("Hello world",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: new Paint()..color=Colors.yellow,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
        ),
      ),
    );
  }
}

class TextSpanSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(text: "Home: "),
        TextSpan(
          text: "https://flutterchina.club",
          style: TextStyle(
            color: Colors.blue
          ),
//          recognizer: _tapRecognizer
        )
      ]
    ));
  }
}

class DefaultTextStyleSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign:  TextAlign.start,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello world"),
            Text("I am Jack"),
            Text("I am Jack",
              style: TextStyle(inherit: false, color: Colors.grey),
            ),
          ],
        ),
    );
  }
}