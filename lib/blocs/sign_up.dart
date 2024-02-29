import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/common.dart';

class SignUpBloc extends Bloc<MyEvent, MyState> {
  SignUpBloc() : super(Initialize()) {
    on<OnChangeSignUpEmailEvent>(_onChangeEmail);
    on<OnChangeSignUpPasswordEvent>(_onChangePassword);
  }

  void _onChangeEmail(OnChangeSignUpEmailEvent event, Emitter<MyState> emit) {
    emit(SignUpState().copyWith(email: event.email));
  }

  void _onChangePassword(OnChangeSignUpPasswordEvent event, Emitter<MyState> emit) {
    emit(SignUpState().copyWith(password: event.password));
  }
}

class OnChangeSignUpEmailEvent extends MyEvent {
  final String email;
  OnChangeSignUpEmailEvent({required this.email});
}

class OnChangeSignUpPasswordEvent extends MyEvent {
  final String password;
  OnChangeSignUpPasswordEvent({required this.password});
}

class SignUpState extends MyState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({this.firstName = "", this.lastName = "", this.email = "", this.password = "", this.confirmPassword = ""});

  SignUpState copyWith({String? firstName, String? lastName, String? email, String? password, String? confirmPassword}) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
