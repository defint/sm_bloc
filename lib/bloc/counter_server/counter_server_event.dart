import 'package:equatable/equatable.dart';

abstract class CounterServerEvent extends Equatable {
  CounterServerEvent([List props = const []]) : super(props);
}

class LoadCounterServer extends CounterServerEvent {
  LoadCounterServer() : super([]);
}
