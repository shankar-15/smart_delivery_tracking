import 'package:flutter/material.dart';

class ShipmentInfoCard extends StatelessWidget {
  const ShipmentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Shipment Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _buildTile(
              Icons.confirmation_number_outlined,
              "Tracking ID",
              "TRK20260001",
            ),

            const Divider(),

            _buildTile(
              Icons.inventory_2_outlined,
              "Package Type",
              "Documents",
            ),

            const Divider(),

            _buildTile(
              Icons.scale_outlined,
              "Weight",
              "1.2 Kg",
            ),

            const Divider(),

            _buildTile(
              Icons.currency_rupee,
              "Charges",
              "₹180",
            ),

            const Divider(),

            _buildTile(
              Icons.flash_on_outlined,
              "Delivery Type",
              "Express Delivery",
            ),

            const Divider(),

            _buildTile(
              Icons.local_shipping_outlined,
              "Courier Partner",
              "Trackly Express",
            ),

            const SizedBox(height: 25),

            const Text(
              "Sender",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Mumbai, Maharashtra",
                  ),

                  SizedBox(height: 5),

                  Text(
                    "+91 9876543210",
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Receiver",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Rahul Sharma",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Pune, Maharashtra",
                  ),

                  SizedBox(height: 5),

                  Text(
                    "+91 9988776655",
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade50,
            child: Icon(
              icon,
              color: Colors.blue,
              size: 20,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}