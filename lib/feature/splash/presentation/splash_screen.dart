import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/theme/appcolor.dart';
import '../../auth/login/presentation/login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<double> truckAnimation;
  late Animation<double> logoScale;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );

    truckAnimation = Tween<double>(
      begin: -1.2,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          .15,
          .75,
          curve: Curves.easeInOut,
        ),
      ),
    );

    logoScale = Tween<double>(
      begin: .5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          .45,
          curve: Curves.elasticOut,
        ),
      ),
    );

    textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          .45,
          .9,
          curve: Curves.easeIn,
        ),
      ),
    );

    _controller.forward();

    Future.delayed(
      const Duration(milliseconds: 3400),
          () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration:
            const Duration(milliseconds: 700),
            pageBuilder: (_, __, ___) =>
            const LoginScreen(),
            transitionsBuilder:
                (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [

                ScaleTransition(
                  scale: logoScale,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 95,
                  ),
                ),

                const SizedBox(height: 45),

                SizedBox(
                  width: 320,
                  height: 90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Positioned(
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.blue
                                .withOpacity(.15),
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment(
                          truckAnimation.value,
                          0,
                        ),
                        child: Transform.rotate(
                          angle: -.05,
                          child: Container(
                            padding:
                            const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  color: Colors.black
                                      .withOpacity(.08),
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.local_shipping,
                              color: AppColors.primary,
                              size: 42,
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),

                const SizedBox(height: 35),

                FadeTransition(
                  opacity: textOpacity,
                  child: Column(
                    children: const [

                      Text(
                        "Trackly",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Smart Courier Tracking",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 45),

                const SizedBox(
                  width: 28,
                  height: 28,
                  child:
                  CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}