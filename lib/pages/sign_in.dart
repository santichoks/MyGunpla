import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/sign_in.dart';
import 'package:my_gunpla/widgets/aleart.dart';
import 'package:my_gunpla/widgets/loading.dart';
import 'package:my_gunpla/widgets/text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocConsumer<SignInBloc, SignInState>(
        builder: (context, state) {
          return MyLoading(
            isLoading: state is SignInLoadingState,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 148,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Sign in with your account",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 34),
                          MyTextField(
                            label: "EMAIL",
                            color: const Color(0xFF0079FF),
                            icon: Icons.mail_outline,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignInBloc>().add(OnChangeEmailSignInEvent(email: value));
                            },
                          ),
                          MyTextField(
                            label: "PASSWORD",
                            color: const Color(0xFF0079FF),
                            icon: Icons.lock_outline,
                            obscureText: true,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignInBloc>().add(OnChangePasswordSignInEvent(password: value));
                            },
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Color(0xFF0079FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: TextButton(
                              onPressed: () {
                                context.read<SignInBloc>().add(
                                      OnClickLoginSignInEvent(
                                        email: state.email,
                                        password: state.password,
                                      ),
                                    );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF0079FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/signUp");
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xFF0079FF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is SignInSuccessState) {
            Navigator.popAndPushNamed(context, "/application");
          }

          if (state is SignInErrorState) {
            showMyAlert(
              context: context,
              title: "Login Error",
              content: state.message,
            );
          }
        },
      ),
    );
  }
}
