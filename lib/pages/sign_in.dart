import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/common.dart';
import 'package:my_gunpla/blocs/sign_in.dart';
import 'package:my_gunpla/pages/sign_up.dart';
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
      child: MyLoading(
        isLoading: false,
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
                      BlocBuilder<SignInBloc, MyState>(
                        builder: (context, state) {
                          return MyTextField(
                            label: "EMAIL",
                            color: const Color(0xFF0079FF),
                            icon: Icons.mail_outline,
                            obscureText: false,
                            onChange: (value) {
                              context.read<SignInBloc>().add(OnChangeSignInEmailEvent(email: value));
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      MyTextField(
                        label: "PASSWORD",
                        color: const Color(0xFF0079FF),
                        icon: Icons.lock_outline,
                        obscureText: true,
                        onChange: (value) {
                          context.read<SignInBloc>().add(OnChangeSignInPasswordEvent(password: value));
                        },
                      ),
                      const SizedBox(height: 34),
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
                          onPressed: () {},
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
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())),
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
      ),
    );
  }
}
