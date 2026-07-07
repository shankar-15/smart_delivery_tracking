import 'package:flutter/material.dart';

import '../../../core/widget/app_textfield.dart';

class ReceiverSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController emailController;

  const ReceiverSection({
    super.key,
    required this.nameController,
    required this.mobileController,
    required this.emailController,
  });

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter receiver name";
    }

    if (value.trim().length < 3) {
      return "Enter valid name";
    }

    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter mobile number";
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
      return "Enter valid mobile number";
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    if (!RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$')
        .hasMatch(value.trim())) {
      return "Enter valid email";
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
                  Icons.person_outline,
                  color: Colors.blue,
                ),

                SizedBox(width: 8),

                Text(
                  "Receiver Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            AppTextField(
              controller: nameController,
              hint: "Receiver Name",
              icon: Icons.person_outline,
              validator: _validateName,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: mobileController,
              hint: "Mobile Number",
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: _validateMobile,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: emailController,
              hint: "Email Address (Optional)",
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
          ],
        ),
      ),
    );
  }
}