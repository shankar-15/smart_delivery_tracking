import 'package:flutter/material.dart';
import 'package:sos_application/screens/profilescreen.dart';
import 'package:sos_application/screens/trackorder.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trackly")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const TrackOrderScreen()));
              },
              child: const Text("Track Order"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
              child: const Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
