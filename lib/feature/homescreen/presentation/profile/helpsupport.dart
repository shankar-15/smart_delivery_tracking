import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xffE3F2FD),
                    child: Icon(
                      Icons.support_agent,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "How can we help you?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "We're here to assist you with your shipments and account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Support Options",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _supportTile(
            icon: Icons.chat_outlined,
            title: "Live Chat",
            subtitle: "Chat with our support team",
            onTap: () {},
          ),

          _supportTile(
            icon: Icons.phone_outlined,
            title: "Call Support",
            subtitle: "+91 1800-123-4567",
            onTap: () {},
          ),

          _supportTile(
            icon: Icons.email_outlined,
            title: "Email Support",
            subtitle: "support@trackly.com",
            onTap: () {},
          ),

          _supportTile(
            icon: Icons.help_outline,
            title: "FAQs",
            subtitle: "Frequently Asked Questions",
            onTap: () {},
          ),

          const SizedBox(height: 25),

          const Text(
            "Quick Help",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            elevation: 0,
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(Icons.inventory_2_outlined),
                  title: const Text("Track Shipment"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.local_shipping_outlined),
                  title: const Text("Book a Courier"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.payments_outlined),
                  title: const Text("Payment Issues"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.report_problem_outlined),
                  title: const Text("Report an Issue"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),

              ],
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.feedback_outlined),
              label: const Text("Send Feedback"),
            ),
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }

  Widget _supportTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
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
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}