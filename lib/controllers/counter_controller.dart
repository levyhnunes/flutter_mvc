import 'package:flutter_mvc/model/counter_model.dart';
import 'package:flutter_mvc/pages/counter_view.dart';

abstract class CounterController {
  void initialize(CounterView counterPage);
  void handleCounter();
  int get counter;
  CounterModel get model;
}
