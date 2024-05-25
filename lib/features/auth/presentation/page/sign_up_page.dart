import 'package:clean_architecture/core/theme/app_pallete.dart';
import 'package:clean_architecture/features/auth/presentation/widget/auth_gradient_button.dart';
import 'package:clean_architecture/features/auth/presentation/widget/auth_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtlr = TextEditingController();
  final _emailCtlr = TextEditingController();
  final _passwordCtlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 195,
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  AuthTextFormField(
                    hintText: "Name",
                    controller: _nameCtlr,
                  ),
                  const SizedBox(height: 15),
                  AuthTextFormField(
                    hintText: "Email",
                    controller: _emailCtlr,

                  ),
                  const SizedBox(height: 15),
                  AuthTextFormField(
                    hintText: "Password",
                    controller: _passwordCtlr,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  AuthGradientButton(textButton: "Sign Up"),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/signin', (route) => false);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
