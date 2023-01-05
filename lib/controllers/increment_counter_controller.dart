import 'package:flutter_mvc/controllers/counter_controller.dart';
import 'package:flutter_mvc/model/counter_model.dart';
import 'package:flutter_mvc/pages/counter_view.dart';

class IncrementCounterController implements CounterController {
  IncrementCounterController({
    required CounterModel model,
  }) : _model = model;

  final CounterModel _model;

  late CounterView _counterPage;

  @override
  void initialize(CounterView counterPage) {
    _counterPage = counterPage;
    _counterPage.createIncrementerButton();
    _model.update(0);
  }

  @override
  void handleCounter() {
    _model.increment();
  }

  @override
  int get counter => _model.counter;

  @override
  CounterModel get model => _model;
}
