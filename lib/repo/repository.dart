import 'package:counter/models/counter.dart';

class Repository {
  Counter _counter = Counter();

  void setCounter(Counter counter) {
    this._counter = counter;
  }

  Future<Counter> getCounter() async {
    return _counter;
  }

  Future<void> increment() async {
    await new Future.delayed(const Duration(seconds: 1));
    _counter.value += 1;
  }

  Future<void> decrement() async {
    await new Future.delayed(const Duration(seconds: 2));
    _counter.value -= 1;
  }

  Future<void> add({required int seconds}) async {
    _counter.value += seconds;
  }
}
