import 'package:flutter/material.dart';
import 'package:sos_application/feature/auth/login/presentation/registration.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/widget/app_textfield.dart';
import '../../../../core/widget/password_textfield.dart';
import '../../../../core/widget/primary_button.dart';
import '../../../homescreen/presentation/main_homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }

    final regex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login Successful (Dummy)"),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const MainHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 110,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Sign in to continue your deliveries",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 35),

                  AppTextField(
                    controller: emailController,
                    hint: AppStrings.email,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),

                  const SizedBox(height: 18),

                  PasswordTextField(
                    controller: passwordController,
                    validator: passwordValidator,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),

                      const Text(
                        "Remember Me",
                      ),

                      const Spacer(),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  PrimaryButton(
                    text: "Sign In",
                    onPressed: login,
                    isLoading: isLoading,
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/icons/google.png",
                        width: 24,
                      ),
                      label: const Text(
                        "Continue with Google",
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Google Sign In coming soon",
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 35),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create Account",
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
    );
  }
}