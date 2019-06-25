import 'package:bloc/bloc.dart';
import 'package:sm_bloc/bloc/app/app_event.dart';

class AppBloc extends Bloc<AppEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    if (event is IncrementCounterApp) {
      yield currentState + 1;
    }
  }
}
