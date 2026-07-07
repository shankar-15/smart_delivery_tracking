import 'package:flutter/material.dart';
import 'package:sos_application/feature/homescreen/presentation/profile/savedaddress.dart';
import 'package:sos_application/feature/homescreen/presentation/profile/setting.dart';

import 'about.dart';
import 'editprofile.dart';
import 'helpsupport.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Profile Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Color(0xffE3F2FD),
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "john.doe@email.com",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "Premium Member",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [

                Expanded(
                  child: _statCard(
                    "Total",
                    "120",
                    Icons.inventory_2_outlined,
                    Colors.blue,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _statCard(
                    "Delivered",
                    "115",
                    Icons.check_circle_outline,
                    Colors.green,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: _statCard(
                    "Active",
                    "05",
                    Icons.local_shipping_outlined,
                    Colors.orange,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _statCard(
                    "Cancelled",
                    "02",
                    Icons.cancel_outlined,
                    Colors.red,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),

            _sectionTitle("Account"),

            _menuTile(
              context,
              Icons.edit_outlined,
              "Edit Profile",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const EditProfileScreen(),
                  ),
                );
              },
            ),

            _menuTile(
              context,
              Icons.location_on_outlined,
              "Saved Addresses",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const SavedAddressesScreen(),
                  ),
                );
              },
            ),

            _menuTile(
              context,
              Icons.settings_outlined,
              "Settings",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const SettingsScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            _sectionTitle("Support"),

            _menuTile(
              context,
              Icons.support_agent_outlined,
              "Help & Support",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const HelpSupportScreen(),
                  ),
                );
              },
            ),

            _menuTile(
              context,
              Icons.info_outline,
              "About",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const AboutScreen(),
                  ),
                );
              },
            ),

            _menuTile(
              context,
              Icons.star_border,
              "Rate App",
                  () {},
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text(
                        "Are you sure you want to logout?",
                      ),
                      actions: [

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);

                            // Navigate Login
                          },
                          child: const Text("Logout"),
                        )

                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _menuTile(
      BuildContext context,
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _statCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        child: Column(
          children: [

            CircleAvatar(
              radius: 22,
              backgroundColor: color.withOpacity(.1),
              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(title),

          ],
        ),
      ),
    );
  }
}