import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/counter_controller.dart';
import 'counter_view.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
    required this.counterPageContoller,
  }) : super(key: key);
  final CounterController counterPageContoller;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> implements CounterView {
  int _counter = 0;
  Icon? _iconButton;
  late VoidCallback subscriber;

  @override
  void initState() {
    super.initState();
    _registerObserverCounter();
    widget.counterPageContoller.initialize(this);
  }

  void _registerObserverCounter() {
    subscriber =
        widget.counterPageContoller.model.registerObserver(_refreshCounter);
  }

  _refreshCounter(int value) {
    setState(() {
      _counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.counterPageContoller.handleCounter,
        child: _iconButton,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    widget.counterPageContoller.model.removeObserver(subscriber);
    super.dispose();
  }

  @override
  createDecrementerButton() {
    _iconButton = const Icon(Icons.remove);
  }

  @override
  createIncrementerButton() {
    _iconButton = const Icon(Icons.add);
  }
}
