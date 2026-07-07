import 'package:flutter/material.dart';

import '../../../core/widget/app_textfield.dart';

class PackageSection extends StatelessWidget {
  final TextEditingController weightController;
  final TextEditingController valueController;
  final TextEditingController descriptionController;

  final String selectedPackage;
  final ValueChanged<String?> onChanged;

  const PackageSection({
    super.key,
    required this.weightController,
    required this.valueController,
    required this.descriptionController,
    required this.selectedPackage,
    required this.onChanged,
  });

  String? _validateWeight(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter package weight";
    }

    final weight = double.tryParse(value);

    if (weight == null || weight <= 0) {
      return "Enter valid weight";
    }

    return null;
  }

  String? _validateValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter package value";
    }

    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter package description";
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
              children: const [

                Icon(
                  Icons.inventory_2_outlined,
                  color: Colors.blue,
                ),

                SizedBox(width: 8),

                Text(
                  "Package Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedPackage,
              decoration: const InputDecoration(
                labelText: "Package Type",
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Documents",
                  child: Text("Documents"),
                ),
                DropdownMenuItem(
                  value: "Electronics",
                  child: Text("Electronics"),
                ),
                DropdownMenuItem(
                  value: "Clothing",
                  child: Text("Clothing"),
                ),
                DropdownMenuItem(
                  value: "Food",
                  child: Text("Food"),
                ),
                DropdownMenuItem(
                  value: "Fragile",
                  child: Text("Fragile"),
                ),
                DropdownMenuItem(
                  value: "Others",
                  child: Text("Others"),
                ),
              ],
              onChanged: onChanged,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: weightController,
              hint: "Weight (Kg)",
              icon: Icons.scale_outlined,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: _validateWeight,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: valueController,
              hint: "Declared Value (₹)",
              icon: Icons.currency_rupee,
              keyboardType: TextInputType.number,
              validator: _validateValue,
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              validator: _validateDescription,
              decoration: const InputDecoration(
                labelText: "Package Description",
                hintText: "Describe the package contents",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.description_outlined),
                ),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Image upload will be added later",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_a_photo_outlined),
                label: const Text("Upload Package Image"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}