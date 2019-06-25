import 'package:equatable/equatable.dart';

abstract class CounterServerState extends Equatable {
  CounterServerState([List props = const []]) : super(props);
}

class CounterServerLoadingState extends CounterServerState {}

class CounterServerErrorState extends CounterServerState {
  final String error;

  CounterServerErrorState(this.error);
}

class CounterServerSuccessState extends CounterServerState {
  final int response;

  CounterServerSuccessState(this.response);
}
