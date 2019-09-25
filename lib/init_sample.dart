import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InitSampleRoute extends StatefulWidget {
  @override
  _InitSampleState createState() => new _InitSampleState();
}

class _InitSampleState extends State<InitSampleRoute> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    _counter = 0;
                  });
                },
                child: Text(
                  "重置",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
