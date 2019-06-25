import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  AppEvent([List props = const []]) : super(props);
}

class IncrementCounterApp extends AppEvent {
  IncrementCounterApp() : super([]);
}
