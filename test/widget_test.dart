import 'package:flutter_mvc/controllers/decrement_counter_controller.dart';
import 'package:flutter_mvc/controllers/increment_counter_controller.dart';
import 'package:flutter_mvc/model/counter_model.dart';
import 'package:flutter_mvc/pages/counter_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("counter controllers", () {
    test(
      'test increment counter controller',
      () {
        // arrange
        final counterView = MockCounterPage();
        final controller = IncrementCounterController(
          model: CounterModelImpl(),
        );

        // act
        controller.initialize(counterView);

        // assert
        expect(counterView.incrementerButtonCreated, true);
        expect(counterView.decrementerButtonCreated, false);
        expect(controller.counter, 0);
      },
    );

    test(
      'test decrement counter controller',
      () {
        // arrange
        final counterView = MockCounterPage();
        final controller = DecrementCounterController(
          model: CounterModelImpl(),
        );

        // act
        controller.initialize(counterView);

        // assert
        expect(counterView.decrementerButtonCreated, true);
        expect(counterView.incrementerButtonCreated, false);
        expect(controller.counter, 10);
      },
    );
  });
}

class MockCounterPage extends CounterView {
  bool decrementerButtonCreated = false;
  bool incrementerButtonCreated = false;

  @override
  createDecrementerButton() {
    decrementerButtonCreated = true;
  }

  @override
  createIncrementerButton() {
    incrementerButtonCreated = true;
  }
}
