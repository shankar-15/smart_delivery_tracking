import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFBBDEFB),
            child: Icon(
              Icons.person,
              size: 40,
              color: Color(0xFF1976D2),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'User Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'user@example.com',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Update Profile'),
            onTap: () {
              // TODO: navigate to profile update screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Update Profile: under development')),
              );
            },
          ),
          const Divider(height: 0),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: navigate to settings screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings: under development')),
              );
            },
          ),
          const Divider(height: 0),

          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              // TODO: help screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Help & Support: under development')),
              );
            },
          ),
          const Divider(height: 0),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // TODO: clear tokens and navigate back to login
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout: under development')),
              );
            },
          ),
        ],
      ),
    );
  }
}
