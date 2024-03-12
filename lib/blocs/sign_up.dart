import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<OnChangeFirstNameSignUpEvent>(_onChangeFirstName);
    on<OnChangeLastNameSignUpEvent>(_onChangeLastName);
    on<OnChangeEmailSignUpEvent>(_onChangeEmail);
    on<OnChangePasswordSignUpEvent>(_onChangePassword);
    on<OnChangeConfirmPasswordSignUpEvent>(_onChangeConfirmPassword);
    on<OnClickCreateAccountSignUpEvent>(_onClickLogin);
    on<OnClearStateSignUpEvent>(_onClearState);
  }

  void _onChangeFirstName(OnChangeFirstNameSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _onChangeLastName(OnChangeLastNameSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _onChangeEmail(OnChangeEmailSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onChangePassword(OnChangePasswordSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onChangeConfirmPassword(OnChangeConfirmPasswordSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onClickLogin(OnClickCreateAccountSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isTouch: true));
    if (state.firstName.isEmpty || state.lastName.isEmpty || state.email.isEmpty || state.password.isEmpty || state.confirmPassword.isEmpty) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(isLoading: false));
    });
  }

  void _onClearState(OnClearStateSignUpEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      confirmPassword: "",
      isLoading: false,
      isTouch: false,
    ));
  }
}

abstract class SignUpEvent {}

class OnChangeFirstNameSignUpEvent extends SignUpEvent {
  final String firstName;

  OnChangeFirstNameSignUpEvent({required this.firstName});
}

class OnChangeLastNameSignUpEvent extends SignUpEvent {
  final String lastName;

  OnChangeLastNameSignUpEvent({required this.lastName});
}

class OnChangeEmailSignUpEvent extends SignUpEvent {
  final String email;

  OnChangeEmailSignUpEvent({required this.email});
}

class OnChangePasswordSignUpEvent extends SignUpEvent {
  final String password;

  OnChangePasswordSignUpEvent({required this.password});
}

class OnChangeConfirmPasswordSignUpEvent extends SignUpEvent {
  final String confirmPassword;

  OnChangeConfirmPasswordSignUpEvent({required this.confirmPassword});
}

class OnClickCreateAccountSignUpEvent extends SignUpEvent {}

class OnClearStateSignUpEvent extends SignUpEvent {}

class SignUpState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final bool isTouch;

  SignUpState({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.isLoading = false,
    this.isTouch = false,
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
    bool? isTouch,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isTouch: isTouch ?? this.isTouch,
    );
  }
}
