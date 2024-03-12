import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_gunpla/common/constants.dart';
import 'package:my_gunpla/common/storage.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<OnChangeEmailSignInEvent>(_onChangeEmail);
    on<OnChangePasswordSignInEvent>(_onChangePassword);
    on<OnClickLoginSignInEvent>(_onClickLogin);
  }

  void _onChangeEmail(OnChangeEmailSignInEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onChangePassword(OnChangePasswordSignInEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onClickLogin(OnClickLoginSignInEvent event, Emitter<SignInState> emit) async {
    final String email = event.email;
    final String password = event.password;
    emit(state.copyWith(isTouch: true));
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    emit(SignInLoadingState());

    final url = Uri.http("localhost:8080", "login");
    final res = await http.post(
      url,
      body: {
        "email": email,
        "password": password,
      },
    );

    final cookies = res.headers['set-cookie'];
    if (res.statusCode == 200 && cookies != null) {
      String accessToken = "";
      String refreshToken = "";

      RegExp regExp = RegExp(r"accessToken=([^;]+)");
      Match? match = regExp.firstMatch(cookies);
      if (match != null) {
        accessToken = match.group(1)!;
      }

      regExp = RegExp(r"refreshToken=([^;]+)");
      match = regExp.firstMatch(cookies);
      if (match != null) {
        refreshToken = match.group(1)!;
      }

      await Storage.setString(Constants.ACCESS_TOKEN, accessToken);
      await Storage.setString(Constants.REFRESH_TOKEN, refreshToken);

      emit(SignInSuccessState());

      return;
    }

    emit(SignInErrorState.parse(jsonDecode(res.body)));
    emit(state.copyWith(email: email, password: password, isTouch: true));
  }
}

abstract class SignInEvent {}

class OnChangeEmailSignInEvent extends SignInEvent {
  final String email;

  OnChangeEmailSignInEvent({required this.email});
}

class OnChangePasswordSignInEvent extends SignInEvent {
  final String password;

  OnChangePasswordSignInEvent({required this.password});
}

class OnClickLoginSignInEvent extends SignInEvent {
  final String email;
  final String password;

  OnClickLoginSignInEvent({required this.email, required this.password});
}

class SignInState {
  final String email;
  final String password;
  final bool isTouch;

  SignInState({
    this.email = "",
    this.password = "",
    this.isTouch = false,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isTouch,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isTouch: isTouch ?? this.isTouch,
    );
  }
}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState({required this.message});

  factory SignInErrorState.parse(Map<String, dynamic> json) {
    return SignInErrorState(
      message: json["message"],
    );
  }
}
