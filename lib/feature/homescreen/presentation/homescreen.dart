import 'package:flutter/material.dart';
import 'package:sos_application/feature/homescreen/presentation/tracking/trackingdetails.dart';

import '../../../core/theme/appcolor.dart';
import 'bookcourierscreen.dart';
import 'main_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController trackingController = TextEditingController();

  @override
  Widget  build(BuildContext context)  {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Good Morning 👋",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                    ),
                  )

                ],
              ),

              const SizedBox(height: 25),

              // Search
              TextField(
                controller: trackingController,
                decoration: InputDecoration(
                  hintText: "Enter Tracking ID",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (trackingController.text.trim().isEmpty) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TrackingDetailsScreen(
                            trackingId: trackingController.text.trim(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TrackingDetailsScreen(
                        trackingId: value.trim(),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: _quickAction(
                      icon: Icons.add_box_rounded,
                      title: "Book\nCourier",
                      color: Colors.blue,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookCourierScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _quickAction(
                      icon: Icons.local_shipping_rounded,
                      title: "Track\nShipment",
                      color: Colors.orange,
                      onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TrackingDetailsScreen(trackingId: '',),
                        ),
                      );},
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Shipment Summary",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.5,
                children: const [

                  _SummaryCard(
                    title: "Active",
                    value: "05",
                    color: Colors.blue,
                  ),

                  _SummaryCard(
                    title: "Delivered",
                    value: "28",
                    color: Colors.green,
                  ),

                  _SummaryCard(
                    title: "Pending",
                    value: "03",
                    color: Colors.orange,
                  ),

                  _SummaryCard(
                    title: "Cancelled",
                    value: "01",
                    color: Colors.red,
                  ),

                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Text(
                    "Recent Shipments",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "View All",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  )

                ],
              ),

              const SizedBox(height: 15),

              _recentShipment(
                trackingId: "TRK20260001",
                status: "Out For Delivery",
                from: "Mumbai",
                to: "Pune",
                statusColor: Colors.orange,
              ),

              const SizedBox(height: 15),

              _recentShipment(
                trackingId: "TRK20260002",
                status: "Delivered",
                from: "Delhi",
                to: "Bangalore",
                statusColor: Colors.green,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color.withOpacity(.1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

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

  Widget _recentShipment({
    required String trackingId,
    required String status,
    required String from,
    required String to,
    required Color statusColor,
  }) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Row(
              children: [

                const CircleAvatar(
                  backgroundColor: Color(0xffEEF5FF),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        trackingId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )

                    ],
                  ),
                ),

                const Icon(Icons.arrow_forward_ios,size:18)

              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                const Icon(Icons.location_on_outlined,size:18),

                const SizedBox(width:5),

                Text(from),

                const Spacer(),

                const Icon(Icons.arrow_forward),

                const Spacer(),

                Text(to)

              ],
            )

          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {

  final String title;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )

        ],
      ),
    );
  }
}