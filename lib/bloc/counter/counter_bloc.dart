import 'package:bloc/bloc.dart';
import 'package:sm_bloc/bloc/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounter) {
      yield currentState + 1;
    }
  }
}
