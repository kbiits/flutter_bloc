part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  late final num counter;
}

class CounterInitial extends CounterState {
  @override
  final num counter = 9;
}

class CounterAdded extends CounterState {
  CounterAdded(num counter) {
    this.counter = counter;
  }
}
