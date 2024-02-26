import 'package:flutter/material.dart';
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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.greenAccent[400],
                  size: 34,
                ),
              ),
              onPressed: () => Navigator.pop(context),
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
                      color: Colors.greenAccent[400]!,
                      icon: Icons.person_outlined,
                    ),
                    const SizedBox(height: 24),
                    MyTextField(
                      label: "LAST NAME",
                      color: Colors.greenAccent[400]!,
                      icon: Icons.person_outlined,
                    ),
                    const SizedBox(height: 24),
                    MyTextField(
                      label: "EMAIL",
                      color: Colors.greenAccent[400]!,
                      icon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 24),
                    MyTextField(
                      label: "PASSWORD",
                      color: Colors.greenAccent[400]!,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 24),
                    MyTextField(
                      label: "CONFIRM PASSWORD",
                      color: Colors.greenAccent[400]!,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 34),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent[400],
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
  }
}
