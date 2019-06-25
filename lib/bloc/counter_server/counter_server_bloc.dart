import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_event.dart';
import 'package:sm_bloc/bloc/counter_server/counter_server_state.dart';

class CounterServerBloc extends Bloc<CounterServerEvent, CounterServerState> {
  final Dio _client = new Dio();

  @override
  CounterServerState get initialState => CounterServerLoadingState();

  @override
  Stream<CounterServerState> mapEventToState(CounterServerEvent event) async* {
    if (event is LoadCounterServer) {
      try {
        Response response = await _client.get(
            'https://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new');

        final data = int.parse(response.data);

        yield CounterServerSuccessState(data);
      } catch (e) {
        yield CounterServerErrorState("Internal server error");
      }
    }
  }
}
