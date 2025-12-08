import 'package:flutter/material.dart';

class OrderItem {
  final String id;
  final String status;
  final String fromCity;
  final String fromPincode;
  final String toCity;
  final String toPincode;
  final bool isUserOrder; // true if placed personally by user

  OrderItem({
    required this.id,
    required this.status,
    required this.fromCity,
    required this.fromPincode,
    required this.toCity,
    required this.toPincode,
    required this.isUserOrder,
  });
}

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  // Dummy list for now; later fetch from backend
  List<OrderItem> _dummyOrders() {
    return [
      OrderItem(
        id: 'TRK123456',
        status: 'In Transit',
        fromCity: 'Mumbai',
        fromPincode: '400001',
        toCity: 'Pune',
        toPincode: '411001',
        isUserOrder: true,
      ),
      OrderItem(
        id: 'TRK987654',
        status: 'Delivered',
        fromCity: 'Delhi',
        fromPincode: '110001',
        toCity: 'Bangalore',
        toPincode: '560001',
        isUserOrder: false,
      ),
      OrderItem(
        id: 'TRK555888',
        status: 'Out for Delivery',
        fromCity: 'Hyderabad',
        fromPincode: '500001',
        toCity: 'Chennai',
        toPincode: '600001',
        isUserOrder: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final orders = _dummyOrders();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: const Color(0xFF1976D2),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: icon + status
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFFE3F2FD),
                        child: Icon(
                          Icons.inventory_2_outlined,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: ${order.id}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Status: ${order.status}',
                              style: TextStyle(
                                color: order.status == 'Delivered'
                                    ? Colors.green
                                    : Colors.orange[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // To / From details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_upward, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'From: ${order.fromCity} - ${order.fromPincode}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_downward, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'To: ${order.toCity} - ${order.toPincode}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Buttons: Track + (Rebook only if user order)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: open detailed tracking screen
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                              Text('Tracking ${order.id} (dummy action)'),
                            ),
                          );
                        },
                        child: const Text('Track'),
                      ),
                      const SizedBox(width: 8),
                      if (order.isUserOrder)
                        OutlinedButton(
                          onPressed: () {
                            // TODO: new order pre-filled from this
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Rebook ${order.id}: under development',
                                ),
                              ),
                            );
                          },
                          child: const Text('Rebook'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
