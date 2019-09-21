import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/avatar.png");
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "图像&图标",
      )),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Column(
            children: <Image>[
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 200.0,
                width: 100.0,
                repeat: ImageRepeat.repeatY,
              ),
            ].map((e) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(() {
                    var label = e.fit.toString();
                    if (e.fit == null) {
                      label = e.repeat == null ? "null" : e.repeat.toString();
                    }
                    return label;
                  }())
                ],
              );
            }).toList(),
          ),
          MaterialIconSamples(),
        ],
      )),
    );
  }
}

class MaterialIconSamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE914";
    icons += "\uE000";
    icons += "\uE90D";

    Text textIcons = Text(
      icons,
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 24.0,
        color: Colors.green,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[textIcons, Text("From Text class")],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.accessible, color: Colors.yellow),
            Icon(
              Icons.error,
              color: Colors.yellow,
            ),
            Icon(
              Icons.fingerprint,
              color: Colors.yellow,
            ),
            Text("From Icon class")
          ],
        )
      ],
    );
  }
}
