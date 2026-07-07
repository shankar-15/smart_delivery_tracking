import 'package:flutter/material.dart';

import '../widgets/address_widget.dart';
import '../widgets/delihveryoption_widget.dart';
import '../widgets/pagesection_widget.dart';
import '../widgets/receiver_widget.dart';



class BookCourierScreen extends StatefulWidget {
  const BookCourierScreen({super.key});

  @override
  State<BookCourierScreen> createState() => _BookCourierScreenState();
}

class _BookCourierScreenState extends State<BookCourierScreen> {
  final _formKey = GlobalKey<FormState>();

  // Pickup
  final pickupAddressController = TextEditingController();
  final pickupPincodeController = TextEditingController();

  // Receiver
  final receiverNameController = TextEditingController();
  final receiverMobileController = TextEditingController();
  final receiverEmailController = TextEditingController();

  // Delivery
  final deliveryAddressController = TextEditingController();
  final deliveryPincodeController = TextEditingController();

  // Package
  final weightController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();

  String packageType = "Documents";
  String deliveryType = "Standard";

  @override
  void dispose() {
    pickupAddressController.dispose();
    pickupPincodeController.dispose();
    receiverNameController.dispose();
    receiverMobileController.dispose();
    receiverEmailController.dispose();
    deliveryAddressController.dispose();
    deliveryPincodeController.dispose();
    weightController.dispose();
    valueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void bookCourier() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Courier Booked Successfully (Dummy)"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Courier"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              AddressSection(
                title: "Pickup Address",
                addressController: pickupAddressController,
                pincodeController: pickupPincodeController,
              ),

              const SizedBox(height: 20),

              ReceiverSection(
                nameController: receiverNameController,
                mobileController: receiverMobileController,
                emailController: receiverEmailController,
              ),

              const SizedBox(height: 20),

              AddressSection(
                title: "Delivery Address",
                addressController: deliveryAddressController,
                pincodeController: deliveryPincodeController,
              ),

              const SizedBox(height: 20),

              PackageSection(
                weightController: weightController,
                valueController: valueController,
                descriptionController: descriptionController,
                selectedPackage: packageType,
                onChanged: (value) {
                  setState(() {
                    packageType = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              DeliveryOptionSection(
                selectedDelivery: deliveryType,
                onChanged: (value) {
                  setState(() {
                    deliveryType = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: bookCourier,
                  child: const Text(
                    "Book Courier",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}