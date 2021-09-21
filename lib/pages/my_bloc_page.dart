import 'package:counter/blocs/cubit/counter_cubit.dart';
import 'package:counter/models/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocPage extends StatelessWidget {
  final String title;

  MyBlocPage({required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state is CounterError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: buildScaffoldBody(context, state),
            floatingActionButton: Row(
              children: [
                FloatingActionButton(
                  onPressed: () => _incrementCounter(context),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () => _decrementCounter(context),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () => _throwError(context),
                  tooltip: 'Throw exception',
                  child: Icon(Icons.error),
                ),
              ],
            ));
      },
    );
  }

  Widget buildScaffoldBody(BuildContext context, dynamic state) {
    if (state is CounterInitial) {
      return buildInitialInput();
    } else if (state is CounterLoading) {
      return buildLoading();
    } else if (state is CounterLoaded) {
      return buildCounterDataColumn(context, state.counter);
    } else {
      // state is CounterError
      return buildInitialInput();
    }
  }

  Center buildCounterDataColumn(BuildContext context, Counter counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text('Input: ${counter.input}'),
          Text('Output: ${counter.output}'),
        ],
      ),
    );
  }

  Widget buildInitialInput() {
    return Container();
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  void _incrementCounter(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    cubit.increment();
  }

  void _decrementCounter(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    cubit.decrement();
  }

  void _throwError(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    cubit.throwError();
  }
}
