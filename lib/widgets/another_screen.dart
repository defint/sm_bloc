import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc/bloc/app/app_bloc.dart';
import 'package:sm_bloc/bloc/app/app_event.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_bloc.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_event.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_state.dart';

class AnotherScreen extends StatefulWidget {
  AnotherScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnotherScreenState createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  void _incrementCounter() {
    final appState = BlocProvider.of<AppBloc>(context);

    appState.dispatch(IncrementCounterApp());
  }

  @override
  initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      final counterServerBloc = BlocProvider.of<CounterServerBloc>(context);
      counterServerBloc.dispatch(LoadCounterServer());
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = BlocProvider.of<AppBloc>(context);
    final counterServerBloc = BlocProvider.of<CounterServerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loaded from the server:',
            ),
            BlocBuilder(
                bloc: counterServerBloc,
                builder:
                    (BuildContext context, CounterServerState counterServer) {
                  if (counterServer is CounterServerLoadingState) {
                    return CircularProgressIndicator();
                  }

                  if (counterServer is CounterServerErrorState) {
                    final error = counterServer.error;
                    return Text(
                      '$error',
                      style: Theme.of(context).textTheme.display1,
                    );
                  }

                  final counterServerValue =
                      (counterServer as CounterServerSuccessState).response;

                  return Text(
                    '$counterServerValue',
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
