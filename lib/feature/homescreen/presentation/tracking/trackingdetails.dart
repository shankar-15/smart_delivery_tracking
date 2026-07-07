import 'package:flutter/material.dart';
import 'package:sos_application/feature/homescreen/presentation/tracking/shipmentinfo.dart';
import 'package:sos_application/feature/homescreen/presentation/tracking/trackinngtimeline.dart';



class TrackingDetailsScreen extends StatelessWidget {
  final String trackingId;

  const TrackingDetailsScreen({
    super.key,
    required this.trackingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Tracking Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [

                  const Icon(
                    Icons.local_shipping,
                    size: 55,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Tracking ID",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    trackingId,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Out For Delivery",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [

                      _infoTile(
                        Icons.schedule,
                        "ETA",
                        "Today\n6:00 PM",
                      ),

                      Container(
                        width: 1,
                        height: 45,
                        color: Colors.grey.shade300,
                      ),

                      _infoTile(
                        Icons.calendar_today_outlined,
                        "Booked",
                        "06 Jul\n2026",
                      ),

                    ],
                  )

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Live Location",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey.shade300,
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.map,
                      size: 60,
                      color: Colors.grey,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Google Maps will appear here",
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Tracking Timeline",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const TrackingTimeline(),

            const SizedBox(height: 30),

            const ShipmentInfoCard(),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone),
                label: const Text("Call Delivery Agent"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.support_agent),
                label: const Text("Contact Support"),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _infoTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Column(
      children: [

        Icon(
          icon,
          color: Colors.blue,
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}