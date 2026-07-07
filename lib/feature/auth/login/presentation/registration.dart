import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/widget/app_textfield.dart';
import '../../../../core/widget/password_textfield.dart';
import '../../../../core/widget/primary_button.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }

    if (value.trim().length < 3) {
      return "Enter a valid name";
    }

    return null;
  }

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter mobile number";
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter valid mobile number";
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter email";
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(value.trim())) {
      return "Enter valid email";
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }

    if (value.length < 8) {
      return "Password should be at least 8 characters";
    }

    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }

    if (value != passwordController.text) {
      return "Passwords do not match";
    }

    return null;
  }

  Future<void> register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Successful (Dummy)"),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
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
                      width: 100,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Create your Trackly account",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 30),

                  AppTextField(
                    controller: fullNameController,
                    hint: "Full Name",
                    icon: Icons.person_outline,
                    validator: nameValidator,
                  ),

                  const SizedBox(height: 18),

                  AppTextField(
                    controller: mobileController,
                    hint: "Mobile Number",
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: mobileValidator,
                  ),

                  const SizedBox(height: 18),

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
                    hinttext: "password",
                    validator: passwordValidator,

                  ),

                  const SizedBox(height: 18),

                  PasswordTextField(
                    controller: confirmPasswordController,
                    hinttext: "Confirm password",
                    validator: confirmPasswordValidator,
                  ),

                  const SizedBox(height: 30),

                  PrimaryButton(
                    text: "Create Account",
                    isLoading: isLoading,
                    onPressed: register,
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        "Already have an account?",
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                        ),
                      )

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