import 'package:flutter/material.dart';

class TrackingTimeline extends StatelessWidget {
  const TrackingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Column(
          children: const [

            _TimelineTile(
              title: "Order Booked",
              subtitle: "06 Jul 2026 • 09:30 AM",
              isCompleted: true,
              isLast: false,
            ),

            _TimelineTile(
              title: "Package Picked Up",
              subtitle: "06 Jul 2026 • 11:00 AM",
              isCompleted: true,
              isLast: false,
            ),

            _TimelineTile(
              title: "Reached Sorting Hub",
              subtitle: "06 Jul 2026 • 05:30 PM",
              isCompleted: true,
              isLast: false,
            ),

            _TimelineTile(
              title: "In Transit",
              subtitle: "07 Jul 2026 • 08:10 AM",
              isCompleted: true,
              isLast: false,
            ),

            _TimelineTile(
              title: "Out For Delivery",
              subtitle: "Today • 09:15 AM",
              isCompleted: true,
              isCurrent: true,
              isLast: false,
            ),

            _TimelineTile(
              title: "Delivered",
              subtitle: "Expected Today • 06:00 PM",
              isCompleted: false,
              isLast: true,
            ),

          ],
        ),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;

  const _TimelineTile({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isCurrent = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isCompleted
        ? (isCurrent ? Colors.orange : Colors.green)
        : Colors.grey;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [

              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted
                      ? (isCurrent
                      ? Icons.local_shipping
                      : Icons.check)
                      : Icons.radio_button_unchecked,
                  size: 16,
                  color: Colors.white,
                ),
              ),

              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    color: isCompleted
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                ),

            ],
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}