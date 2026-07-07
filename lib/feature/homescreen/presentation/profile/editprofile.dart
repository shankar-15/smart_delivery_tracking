import 'package:flutter/material.dart';

import '../../../../core/widget/app_textfield.dart';
import '../../../../core/widget/primary_button.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: "John Doe");
  final emailController =
  TextEditingController(text: "john.doe@email.com");
  final mobileController =
  TextEditingController(text: "9876543210");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  void saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Updated Successfully"),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Stack(
                children: [

                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffE3F2FD),
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.blue,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )

                ],
              ),

              const SizedBox(height: 30),

              AppTextField(
                controller: nameController,
                hint: "Full Name",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 18),

              AppTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 18),

              AppTextField(
                controller: mobileController,
                hint: "Mobile Number",
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 35),

              PrimaryButton(
                text: "Save Changes",
                onPressed: saveProfile,
              )

            ],
          ),
        ),
      ),
    );
  }
}