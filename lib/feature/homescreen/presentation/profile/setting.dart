
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;
  bool biometric = false;
  bool locationPermission = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Preferences",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 0,
            child: Column(
              children: [

                SwitchListTile(
                  value: notifications,
                  title: const Text("Push Notifications"),
                  subtitle: const Text(
                    "Receive shipment updates",
                  ),
                  secondary: const Icon(
                    Icons.notifications_outlined,
                  ),
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),

                const Divider(height: 0),

                SwitchListTile(
                  value: darkMode,
                  title: const Text("Dark Mode"),
                  subtitle: const Text(
                    "Enable dark appearance",
                  ),
                  secondary: const Icon(
                    Icons.dark_mode_outlined,
                  ),
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),

                const Divider(height: 0),

                SwitchListTile(
                  value: biometric,
                  title: const Text("Biometric Login"),
                  subtitle: const Text(
                    "Fingerprint / Face Unlock",
                  ),
                  secondary: const Icon(
                    Icons.fingerprint,
                  ),
                  onChanged: (value) {
                    setState(() {
                      biometric = value;
                    });
                  },
                ),

                const Divider(height: 0),

                SwitchListTile(
                  value: locationPermission,
                  title: const Text("Location Access"),
                  subtitle: const Text(
                    "Allow live courier tracking",
                  ),
                  secondary: const Icon(
                    Icons.location_on_outlined,
                  ),
                  onChanged: (value) {
                    setState(() {
                      locationPermission = value;
                    });
                  },
                ),

              ],
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "General",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 0,
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Language"),
                  subtitle: const Text("English"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text("Change Password"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: const Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Delete Account"),
                        content: const Text(
                          "This action cannot be undone.",
                        ),
                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          ),

          const SizedBox(height: 30),

        ],
      ),
    );
  }
}