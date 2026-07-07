import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_shipping,
                size: 55,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Trackly",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Version $appVersion",
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Trackly is a modern courier booking and shipment tracking application designed to simplify logistics for individuals and businesses. Book shipments, monitor deliveries in real-time, manage addresses, and receive instant shipment updates from one place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 0,
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text("Developer"),
                    subtitle: const Text("Trackly Team"),
                  ),

                  const Divider(height: 0),

                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text("Website"),
                    subtitle: const Text("www.trackly.com"),
                    trailing: const Icon(Icons.open_in_new),
                    onTap: () {},
                  ),

                  const Divider(height: 0),

                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text("Email"),
                    subtitle: const Text("support@trackly.com"),
                    trailing: const Icon(Icons.send),
                    onTap: () {},
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 0,
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: const Text("Privacy Policy"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  const Divider(height: 0),

                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: const Text("Terms & Conditions"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  const Divider(height: 0),

                  ListTile(
                    leading: const Icon(Icons.star_outline),
                    title: const Text("Rate Trackly"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  const Divider(height: 0),

                  ListTile(
                    leading: const Icon(Icons.share_outlined),
                    title: const Text("Share App"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "© 2026 Trackly. All Rights Reserved.",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}