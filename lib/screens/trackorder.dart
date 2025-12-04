import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Track Order")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "Enter Tracking ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final id = idController.text;
                if (id.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Order Status"),
                      content: Text(
                          "Tracking ID: $id\n\nStatus: In Transit 🚚\nEstimated Delivery: Tomorrow"),
                    ),
                  );
                }
              },
              child: const Text("Check Status"),
            ),
          ],
        ),
      ),
    );
  }
}
