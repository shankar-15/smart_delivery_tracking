import 'package:flutter/material.dart';

class DeliveryOptionSection extends StatelessWidget {
  final String selectedDelivery;
  final ValueChanged<String?> onChanged;

  const DeliveryOptionSection({
    super.key,
    required this.selectedDelivery,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: const [

                Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.blue,
                ),

                SizedBox(width: 8),

                Text(
                  "Delivery Type",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            RadioListTile<String>(
              value: "Standard",
              groupValue: selectedDelivery,
              onChanged: onChanged,
              title: const Text("Standard Delivery"),
              subtitle: const Text("3 - 5 Business Days"),
              secondary: const Icon(Icons.local_shipping_outlined),
            ),

            const Divider(),

            RadioListTile<String>(
              value: "Express",
              groupValue: selectedDelivery,
              onChanged: onChanged,
              title: const Text("Express Delivery"),
              subtitle: const Text("1 - 2 Business Days"),
              secondary: const Icon(Icons.flash_on_outlined),
            ),

            const Divider(),

            RadioListTile<String>(
              value: "Same Day",
              groupValue: selectedDelivery,
              onChanged: onChanged,
              title: const Text("Same Day Delivery"),
              subtitle: const Text("Within 24 Hours"),
              secondary: const Icon(Icons.bolt_outlined),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.blue.shade100,
                ),
              ),
              child: Row(
                children: [

                  const Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      _deliveryMessage(selectedDelivery),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  String _deliveryMessage(String deliveryType) {
    switch (deliveryType) {
      case "Express":
        return "Estimated delivery within 1-2 business days.";

      case "Same Day":
        return "Delivery will be attempted within 24 hours in eligible locations.";

      default:
        return "Standard delivery usually takes 3-5 business days.";
    }
  }
}