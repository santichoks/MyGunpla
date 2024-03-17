import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/sign_up.dart';
import 'package:my_gunpla/widgets/loading.dart';
import 'package:my_gunpla/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return MyLoading(
            isLoading: state.isLoading,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: Color(0xFF0079FF),
                        size: 34,
                      ),
                    ),
                    onPressed: () {
                      context.read<SignUpBloc>().add(OnClearStateSignUpEvent());
                      Navigator.pop(context);
                    },
                  ),
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 34),
                      child: Column(
                        children: [
                          const Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Create a new account",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 34),
                          MyTextField(
                            label: "FIRST NAME",
                            color: Colors.blue[900]!,
                            icon: Icons.person_outlined,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignUpBloc>().add(OnChangeFirstNameSignUpEvent(firstName: value));
                            },
                          ),
                          MyTextField(
                            label: "LAST NAME",
                            color: Colors.blue[900]!,
                            icon: Icons.person_outlined,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignUpBloc>().add(OnChangeLastNameSignUpEvent(lastName: value));
                            },
                          ),
                          MyTextField(
                            label: "EMAIL",
                            color: Colors.blue[900]!,
                            icon: Icons.mail_outline,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignUpBloc>().add(OnChangeEmailSignUpEvent(email: value));
                            },
                          ),
                          MyTextField(
                            label: "PASSWORD",
                            color: Colors.blue[900]!,
                            icon: Icons.lock_outline,
                            obscureText: true,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignUpBloc>().add(OnChangePasswordSignUpEvent(password: value));
                            },
                          ),
                          MyTextField(
                            label: "CONFIRM PASSWORD",
                            color: Colors.blue[900]!,
                            icon: Icons.lock_outline,
                            obscureText: true,
                            isTouch: state.isTouch,
                            onChange: (value) {
                              context.read<SignUpBloc>().add(OnChangeConfirmPasswordSignUpEvent(confirmPassword: value));
                            },
                          ),
                          const SizedBox(height: 34),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: TextButton(
                              onPressed: () {
                                context.read<SignUpBloc>().add(OnClickCreateAccountSignUpEvent());
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue[900],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
        listener: (context, state) {},
      ),
    );
  }
}
