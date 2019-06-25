import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc/bloc/app/app_bloc.dart';
import 'package:sm_bloc/bloc/app/app_event.dart';
import 'package:sm_bloc/bloc/counter/counter_bloc.dart';
import 'package:sm_bloc/bloc/counter/counter_event.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() {
    final appState = BlocProvider.of<AppBloc>(context);
    final counterState = BlocProvider.of<CounterBloc>(context);

    counterState.dispatch(IncrementCounter());
    appState.dispatch(IncrementCounterApp());
  }

  @override
  Widget build(BuildContext context) {
    final appState = BlocProvider.of<AppBloc>(context);
    final counterState = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button (local):',
            ),
            BlocBuilder(
                bloc: counterState,
                builder: (BuildContext context, int counterLocal) {
                  return Text(
                    '$counterLocal',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
            Container(margin: EdgeInsets.only(top: 20.0)),
            Text(
              'You have pushed the button (global):',
            ),
            BlocBuilder(
                bloc: appState,
                builder: (BuildContext context, int counterGlobal) {
                  return Text(
                    '$counterGlobal',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
            Container(margin: EdgeInsets.only(top: 20.0)),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/another');
              },
              child: Text('Go to another screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
