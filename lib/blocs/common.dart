abstract class MyEvent {}

abstract class MyState {}

class Initialize extends MyState {}

class Loading extends MyState {}

class Error extends MyState {
  final String message;
  Error({required this.message});
}
