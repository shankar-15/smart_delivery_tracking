import 'package:flutter/material.dart';
import 'package:sos_application/feature/home/presentation/homescreen.dart';
import 'package:sos_application/feature/registration/presentation/registration.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/widget/app_textfield.dart';
import '../../../../core/widget/password_textfield.dart';
import '../../../../core/widget/primary_button.dart';

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

  String? emailValidator(String? value) {

    if (value == null || value.isEmpty) {
      return "Please enter email";
    }

    if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value)) {
      return "Invalid email";
    }

    return null;
  }

  String? passwordValidator(String? value) {

    if (value == null || value.isEmpty) {
      return "Please enter password";
    }

    if (value.length < 8) {
      return "Minimum 8 characters";
    }

    return null;
  }

  void login() {

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(seconds: 2),
          () {
            Navigator.push(

              context,

              MaterialPageRoute(

                builder: (_) => const HomeTab(),

              ),

            );

        setState(() {
          isLoading = false;
        });

          }




    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Center(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(24),

            child: Form(

              key: _formKey,

              child: Column(

                children: [

                  Image.asset(
                    "assets/images/logo.png",
                    width: 120,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Sign in to continue tracking deliveries",
                    style: TextStyle(
                      color: Colors.grey.shade600,
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

                  const SizedBox(height: 10),

                  Row(

                    children: [

                      Checkbox(

                        value: rememberMe,

                        onChanged: (value) {

                          setState(() {

                            rememberMe = value!;

                          });

                        },

                      ),

                      const Text("Remember Me"),

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

                    text: AppStrings.login,

                    isLoading: isLoading,

                    onPressed: login,

                  ),

                  const SizedBox(height: 25),

                  Row(

                    children: const [

                      Expanded(child: Divider()),

                      Padding(

                        padding: EdgeInsets.symmetric(horizontal: 12),

                        child: Text("OR"),

                      ),

                      Expanded(child: Divider()),

                    ],

                  ),

                  const SizedBox(height: 25),

                  SizedBox(

                    width: double.infinity,

                    height: 55,

                    child: OutlinedButton.icon(

                      icon: Image.asset(
                        "assets/icons/google.png",
                        width: 24,
                      ),

                      label: const Text(
                        "Continue with Google",
                      ),

                      onPressed: () {

                        // Tomorrow

                        // Firebase Google Login

                      },

                    ),

                  ),

                  const SizedBox(height: 30),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account?",
                      ),

                      TextButton(

                        onPressed: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) => const RegisterScreen(),

                            ),

                          );

                        },

                        child: const Text(
                          "Create Account",
                        ),

                      )

                    ],

                  )

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}