import 'package:bloc/bloc.dart';
import 'package:counter/models/counter.dart';
import 'package:counter/repo/repository.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._repo) : super(CounterInitial());
  final Repository _repo;
  Future<void> getCounter() async {
    try {
      emit(CounterLoading());
      Counter counter = await _repo.getCounter();
      emit(CounterLoaded(counter));
    } on Exception {
      emit(CounterError('Couldn' 't fetch counter'));
    }
  }

  Future<void> increment() async {
    emit(CounterLoading());
    await _repo.increment();
    await getCounter();
  }

  Future<void> decrement() async {
    emit(CounterLoading());
    await _repo.decrement();
    await getCounter();
  }

  Future<void> throwError() async {
    emit(CounterError('Exception was thrown!'));
    await getCounter();
  }
}
