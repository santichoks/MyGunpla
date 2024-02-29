import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/common.dart';

class SignInBloc extends Bloc<MyEvent, MyState> {
  SignInBloc() : super(Initialize()) {
    on<OnChangeSignInEmailEvent>(_onChangeEmail);
    on<OnChangeSignInPasswordEvent>(_onChangePassword);
  }

  void _onChangeEmail(OnChangeSignInEmailEvent event, Emitter<MyState> emit) {
    emit(SignInState().copyWith(email: event.email));
  }

  void _onChangePassword(OnChangeSignInPasswordEvent event, Emitter<MyState> emit) {
    emit(SignInState().copyWith(password: event.password));
  }
}

class OnChangeSignInEmailEvent extends MyEvent {
  final String email;

  OnChangeSignInEmailEvent({required this.email});
}

class OnChangeSignInPasswordEvent extends MyEvent {
  final String password;

  OnChangeSignInPasswordEvent({required this.password});
}

class SignInState extends MyState {
  final String email;
  final String password;

  SignInState({this.email = "", this.password = ""});

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
