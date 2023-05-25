import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void addCounter() {
    if (state is CounterInitial) {
      log("pertama kali klik button add");
    } else {
      log("bukan pertama kali klik button add");
    }
    emit(CounterAdded(state.counter + 1));
  }
}
