import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/decrement_counter_controller.dart';
import 'package:flutter_mvc/controllers/increment_counter_controller.dart';
import 'package:flutter_mvc/model/counter_model.dart';
import 'package:flutter_mvc/pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CounterPage(
      //   counterPageContoller: DecrementCounterController(
      //     model: CounterModelImpl(),
      //   ),
      // ),
      home: CounterPage(
        counterPageContoller: IncrementCounterController(
          model: CounterModelImpl(),
        ),
      ),
    );
  }
}
