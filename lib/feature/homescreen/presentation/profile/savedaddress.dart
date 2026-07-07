import 'package:flutter/material.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() =>
      _SavedAddressesScreenState();
}

class _SavedAddressesScreenState
    extends State<SavedAddressesScreen> {
  final List<Map<String, String>> addresses = [
    {
      "title": "Home",
      "name": "John Doe",
      "address":
      "Flat 301, ABC Residency, Andheri East, Mumbai - 400059",
      "mobile": "+91 9876543210",
    },
    {
      "title": "Office",
      "name": "John Doe",
      "address":
      "Trackly Technologies, Hinjewadi Phase 2, Pune - 411057",
      "mobile": "+91 9876543210",
    },
  ];

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Address Deleted"),
      ),
    );
  }

  void _editAddress(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Edit ${addresses[index]["title"]} (Coming Soon)",
        ),
      ),
    );
  }

  void _addAddress() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Add Address Screen Coming Soon"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Addresses"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addAddress,
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];

          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      CircleAvatar(
                        backgroundColor:
                        Colors.blue.shade50,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          address["title"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),

                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == "edit") {
                            _editAddress(index);
                          } else {
                            _deleteAddress(index);
                          }
                        },
                        itemBuilder: (_) => const [

                          PopupMenuItem(
                            value: "edit",
                            child: Text("Edit"),
                          ),

                          PopupMenuItem(
                            value: "delete",
                            child: Text("Delete"),
                          ),

                        ],
                      )

                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    address["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(address["address"]!),

                  const SizedBox(height: 10),

                  Row(
                    children: [

                      const Icon(
                        Icons.phone,
                        size: 18,
                      ),

                      const SizedBox(width: 8),

                      Text(address["mobile"]!),

                    ],
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}