import 'package:flutter/material.dart';

import '../../../core/widget/app_textfield.dart';


class AddressSection extends StatelessWidget {
  final String title;
  final TextEditingController addressController;
  final TextEditingController pincodeController;

  const AddressSection({
    super.key,
    required this.title,
    required this.addressController,
    required this.pincodeController,
  });

  String? _validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter address";
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter pincode";
    }

    if (!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return "Enter valid 6 digit pincode";
    }

    return null;
  }

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
              children: [

                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),

                const SizedBox(width: 8),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            AppTextField(
              controller: addressController,
              hint: "Complete Address",
              icon: Icons.home_outlined,
              validator: _validateAddress,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: pincodeController,
              hint: "Pincode",
              icon: Icons.pin_drop_outlined,
              keyboardType: TextInputType.number,
              validator: _validatePincode,
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Current Location integration coming soon",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.my_location),
                label: const Text("Use Current Location"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}