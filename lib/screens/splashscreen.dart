import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _truckAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _truckAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // ✔ White background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🚚 Bigger animated truck
              SizedBox(
                height: 150,   // ⬆ Increased height
                width: 320,    // ⬆ Increased width
                child: AnimatedBuilder(
                  animation: _truckAnimation,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Track line
                        Positioned(
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                        // Moving truck
                        Align(
                          alignment: Alignment(_truckAnimation.value, 0),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.red, // ✔ Red outline
                                width: 3,
                              ),
                            ),
                            child: const Icon(
                              Icons.local_shipping,
                              size: 45,         // ⬆ Bigger icon size
                              color: Colors.red, // ✔ Red icon
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // 🔤 App Name
              const Text(
                "Trackly",
                style: TextStyle(
                  fontSize: 40,              // Larger text
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  // ✔ Red text
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Smart Delivery Tracking",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


