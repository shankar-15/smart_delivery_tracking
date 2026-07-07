import 'package:flutter/material.dart';
import 'package:sos_application/feature/homescreen/presentation/tracking/trackingdetails.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  final TextEditingController searchController = TextEditingController();

  int selectedFilter = 0;

  final List<String> filters = [
    "All",
    "Active",
    "Delivered",
    "Cancelled",
  ];

  final List<Map<String, dynamic>> orders = [
    {
      "id": "TRK20260001",
      "status": "Out For Delivery",
      "from": "Mumbai",
      "to": "Pune",
      "date": "06 Jul 2026",
      "color": Colors.orange,
    },
    {
      "id": "TRK20260002",
      "status": "Delivered",
      "from": "Delhi",
      "to": "Bangalore",
      "date": "04 Jul 2026",
      "color": Colors.green,
    },
    {
      "id": "TRK20260003",
      "status": "Cancelled",
      "from": "Hyderabad",
      "to": "Chennai",
      "date": "02 Jul 2026",
      "color": Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Shipments"),
        centerTitle: true,
      ),

      body: RefreshIndicator(

        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 1),
          );
        },

        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Tracking ID",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
                itemBuilder: (context, index) {

                  final selected =
                      selectedFilter == index;

                  return ChoiceChip(
                    label: Text(filters[index]),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        selectedFilter = index;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            ...orders.map(
                  (order) => Padding(
                padding:
                const EdgeInsets.only(bottom: 18),
                child: _orderCard(order),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _orderCard(Map<String, dynamic> order) {

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Row(
              children: [

                CircleAvatar(
                  backgroundColor:
                  order["color"].withOpacity(.12),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: order["color"],
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        order["id"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        order["status"],
                        style: TextStyle(
                          color: order["color"],
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                ),

                const Icon(Icons.chevron_right)

              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                ),

                const SizedBox(width: 5),

                Text(order["from"]),

                const Spacer(),

                const Icon(Icons.arrow_forward),

                const Spacer(),

                Text(order["to"])

              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Colors.grey.shade700,
                ),

                const SizedBox(width: 5),

                Text(order["date"]),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TrackingDetailsScreen(
                          trackingId: order["id"],
                        ),
                      ),
                    );
                  },
                  child: const Text("Track"),
                ),

                const SizedBox(width: 10),

                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Rebook"),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}