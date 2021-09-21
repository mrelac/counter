import 'package:counter/blocs/cubit/counter_cubit.dart';
import 'package:counter/pages/my_bloc_page.dart';
import 'package:counter/pages/my_stateful_page.dart';
import 'package:counter/repo/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Repository repo = Repository();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(repo),
        // child: MyStatefulPage(title: 'Flutter Demo Stateful Counter'),

        child: MyBlocPage(title: 'Flutter Demo Cubit Counter'),
      ),
    );
  }
}
