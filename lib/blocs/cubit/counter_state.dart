part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterLoading extends CounterState {
  const CounterLoading();
}

class CounterLoaded extends CounterState {
  final Counter counter;
  const CounterLoaded(this.counter);
}

class CounterError extends CounterState {
  final String message;
  const CounterError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
