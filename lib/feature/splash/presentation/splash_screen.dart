import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/theme/appcolor.dart';
import '../../../screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;

  late Animation<double> _logoScale;
  late Animation<double> _logoFade;

  late Animation<double> _textFade;
  late Animation<Offset> _textSlide;

  final List<String> loadingMessages = [
    "Initializing...",
    "Loading preferences...",
    "Preparing deliveries...",
    "Almost Ready..."
  ];

  int currentMessage = 0;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _logoScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.elasticOut,
      ),
    );

    _logoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_logoController);

    _textFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_textController);

    _textSlide = Tween<Offset>(
      begin: const Offset(0, .3),
      end: Offset.zero,
    ).animate(_textController);

    _initialize();
  }

  Future<void> _initialize() async {
    _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 700));

    _textController.forward();

    Timer.periodic(
      const Duration(milliseconds: 600),
          (timer) {
        if (currentMessage == loadingMessages.length - 1) {
          timer.cancel();
        } else {
          setState(() {
            currentMessage++;
          });
        }
      },
    );

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color(0xffF3F8FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FadeTransition(
                    opacity: _logoFade,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: Hero(
                        tag: "logo",
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 120,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  FadeTransition(
                    opacity: _textFade,
                    child: SlideTransition(
                      position: _textSlide,
                      child: Text(
                        AppStrings.appName,
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  FadeTransition(
                    opacity: _textFade,
                    child: const Text(
                      "Delivering Beyond Expectations",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        letterSpacing: .5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 55),

                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 25),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      loadingMessages[currentMessage],
                      key: ValueKey(currentMessage),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          "Version 1.0.0",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}