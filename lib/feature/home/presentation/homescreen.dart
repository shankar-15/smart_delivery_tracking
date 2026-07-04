import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xff1565C0),
                    child: Icon(Icons.person,
                        color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "hello 👋",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Shreya",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Badge(
                      child: Icon(Icons.notifications_none),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// SEARCH BOX
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(.04),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Track Shipment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Tracking ID",
                        prefixIcon:
                        const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.location_searching),
                        label: const Text("Track"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xff1565C0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: _actionCard(
                      icon: Icons.inventory_2_outlined,
                      title: "Book\nCourier",
                      color: Colors.orange,
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _actionCard(
                      icon: Icons.local_shipping_outlined,
                      title: "Track\nOrder",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Shipment Summary",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _summaryCard(
                        "2", "Active", Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _summaryCard(
                        "18", "Delivered", Colors.green),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _summaryCard(
                        "1", "Pending", Colors.red),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Recent Shipments",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 15),

              _shipmentCard(
                id: "TRK123456",
                from: "Pune",
                to: "Mumbai",
                status: "Out for Delivery",
                color: Colors.orange,
              ),

              const SizedBox(height: 15),

              _shipmentCard(
                id: "TRK789654",
                from: "Delhi",
                to: "Bangalore",
                status: "Delivered",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor:
              color.withOpacity(.15),
              child: Icon(icon,
                  color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(
      String value,
      String title,
      Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }

  Widget _shipmentCard({
    required String id,
    required String from,
    required String to,
    required String status,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor:
                Color(0xffE3F2FD),
                child: Icon(
                  Icons.local_shipping,
                  color: Color(0xff1565C0),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: color,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Track"),
              )
            ],
          ),
          const Divider(height: 25),
          Row(
            children: [
              const Icon(Icons.circle,
                  color: Colors.green,
                  size: 10),
              const SizedBox(width: 8),
              Expanded(child: Text(from)),
              const Icon(Icons.arrow_forward),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(to),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}