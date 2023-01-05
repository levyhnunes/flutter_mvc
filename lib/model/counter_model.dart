// Esse model poderia ser um usecase/repository/service...

import 'package:flutter/widgets.dart';

abstract class CounterModel {
  int get counter;
  int increment();
  int decrement();
  int update(int value);
  VoidCallback registerObserver(Function(int counter) callback);
  void removeObserver(VoidCallback observer);
}

class CounterModelImpl implements CounterModel {
  final _counter = ValueNotifier<int>(0);

  @override
  int get counter => _counter.value;

  @override
  int increment() => ++_counter.value;

  @override
  int decrement() => --_counter.value;

  @override
  int update(int value) => _counter.value = value;

  @override
  Function() registerObserver(Function(int counter) callback) {
    final listener = _createListener(callback);
    _counter.addListener(listener);
    return listener;
  }

  VoidCallback _createListener(Function(int counter) callback) {
    return () {
      callback(_counter.value);
    };
  }

  @override
  void removeObserver(VoidCallback observer) {
    _counter.removeListener(observer);
  }
}
