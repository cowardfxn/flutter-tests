import 'package:flutter/cupertino.dart';

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.png", width: 60.0);
    return Center(
      child: Column(
        children: <Widget>[
          avatar, // 不裁剪
          ClipOval(
            child: avatar,
          ), // 裁剪为圆形
          ClipRRect(
            // 裁剪为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, // 宽度设置为原来的一半，另一半会溢出
                child: avatar,
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                // 将溢出部分裁剪
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, // 宽度设为原来的一半
                  child: avatar,
                ),
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          DecoratedBox(
            // 自定义Clip类
            decoration: BoxDecoration(color: Colors.red),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false; // 是否重新裁剪
}
