// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_mvc/controllers/counter_controller.dart';
import 'package:flutter_mvc/model/counter_model.dart';
import 'package:flutter_mvc/pages/counter_view.dart';

class DecrementCounterController implements CounterController {
  DecrementCounterController({
    required CounterModel model,
  }) : _model = model;

  final CounterModel _model;
  late CounterView _counterPage;

  @override
  void initialize(
    CounterView counterPage,
  ) {
    _counterPage = counterPage;
    _counterPage.createDecrementerButton();
    _model.update(10);
  }

  @override
  void handleCounter() {
    _model.decrement();
  }

  @override
  int get counter => _model.counter;

  @override
  CounterModel get model => _model;
}
