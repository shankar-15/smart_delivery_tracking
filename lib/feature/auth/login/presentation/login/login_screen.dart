import 'package:flutter/material.dart';
import 'package:sos_application/feature/auth/login/presentation/login/socialicon.dart';

import '../../../../../core/theme/appcolor.dart';
import '../../../../../core/widget/app_textfield.dart';
import '../../../../../core/widget/primary_button.dart';
import '../../../../homescreen/presentation/main_homescreen.dart';
import '../registration.dart';
import 'login_header.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  late AnimationController _animationController;

  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, .15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void login() {

    if (!_formKey.currentState!.validate()) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MainHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(

        child: FadeTransition(

          opacity: fadeAnimation,

          child: SlideTransition(

            position: slideAnimation,

            child: SingleChildScrollView(

              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: Form(

                key: _formKey,

                child: Column(

                  children: [

                    const SizedBox(height: 30),

                    const LoginHeader(),

                    const SizedBox(height: 45),

                    AppTextField(
                      controller: emailController,
                      hint: "Email Address",
                      icon: Icons.email_outlined,
                      keyboardType:
                      TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 18),

                    AppTextField(
                      controller: passwordController,
                      hint: "Password",
                      icon: Icons.lock_outline,
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword =
                            !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    PrimaryButton(
                      text: "Sign In",
                      onPressed: login,
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [

                        Expanded(
                          child: Divider(
                            color: AppColors.border,
                          ),
                        ),

                        const Padding(
                          padding:
                          EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Text("OR"),
                        ),

                        Expanded(
                          child: Divider(
                            color: AppColors.border,
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 28),

                    SocialLoginButton(
                      title:
                      "Continue with Google",
                      image:
                      "assets/images/google.png",
                      onTap: () {},
                    ),

                    const SizedBox(height: 45),

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
                        )

                      ],
                    ),

                    const SizedBox(height: 30),

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