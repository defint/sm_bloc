import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  CounterEvent([List props = const []]) : super(props);
}

class IncrementCounter extends CounterEvent {
  IncrementCounter() : super([]);
}
