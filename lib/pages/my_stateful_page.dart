import 'package:counter/models/counter.dart';
import 'package:flutter/material.dart';

class MyStatefulPage extends StatefulWidget {
  MyStatefulPage({required this.title}) : super();
  final String title;

  @override
  _MyStatefulPageState createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  var counter;

  @override
  void initState() {
    super.initState();
    counter =
        Counter(title: widget.title, value: 0, input: 'abc', output: 'def');
  }

  void _incrementCounter() {
    setState(() {
      counter.value++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter.value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text('Input: ${counter.input}'),
              Text('Output: ${counter.output}'),
            ],
          ),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ], // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
