import 'package:flutter/material.dart';

Widget getScaffold(String title, Widget body) {
  return Scaffold(
    appBar: AppBar(title: Text(title),),
    body: body,
  );
}

