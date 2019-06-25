import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc/bloc/app/app_bloc.dart';
import 'package:sm_bloc/bloc/counter/counter_bloc.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_bloc.dart';
import 'package:sm_bloc/widgets/another_screen.dart';
import 'package:sm_bloc/widgets/home_screen.dart';

void main() => runApp(BlocProviderTree(blocProviders: [
      BlocProvider<AppBloc>(builder: (context) => AppBloc()),
    ], child: new SmBLOCApp()));

class SmBLOCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Native',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          buttonColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProviderTree(blocProviders: [
              BlocProvider<CounterBloc>(builder: (context) => CounterBloc()),
            ], child: HomeScreen(title: 'Local + Global')),
        '/another': (context) => BlocProviderTree(blocProviders: [
              BlocProvider<CounterServerBloc>(
                  builder: (context) => CounterServerBloc()),
            ], child: AnotherScreen(title: 'Local + Async')),
      },
    );
  }
}
