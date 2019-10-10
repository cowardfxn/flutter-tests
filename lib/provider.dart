import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

// Provider 原理示意，实际项目中可以使用Provider, Redux, MobX, BLoC等状态管理专用包
final ProviderRoute = () => getScaffold("跨组件状态共享", ProviderTest());

// 一个通用的InheritedWidget，保存任意需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  // 共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    // 返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`
    return true;
  }
}

// 在Dart中获取模板类型的函数
Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  // 定义一个便捷的of方法，便于子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget
            as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      new _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    // 如果数据发生变化(model类调用了notifyListeners), 重新构建InheritedProvider
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // 当Provider更新时，如果新旧数据不相等，则解绑旧数据监听，添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器，防止内存泄漏
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

// 商品信息类
class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

// 购物车类
class CartModel extends ChangeNotifier {
  // 购物车中的商品列表
  final List<Item> _items = [];

  // 禁止改变购物车中的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中的商品总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将item添加到购物车
  void add(Item item) {
    _items.add(item);
    // 通知监听器(订阅者)，重新构建InheritedProvider，更新状态
    notifyListeners();
  }
}

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}

class ProviderTest extends StatefulWidget {
  @override
  _ProviderTestState createState() => new _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Consumer<CartModel>(
                        builder: (context, cart) =>
                            Text("总价: ${cart.totalPrice}")),
                  ),
                  Builder(
                    builder: (context) {
                      print("RaisedButton build");
                      return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          // 给购物车添加商品
                          ChangeNotifierProvider.of<CartModel>(context,
                                  listen: false)
                              .add(Item(20.0, 1));
                        },
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}
