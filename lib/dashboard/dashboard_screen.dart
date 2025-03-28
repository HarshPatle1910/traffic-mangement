import 'package:flutter/material.dart';
import 'package:traffic_management_dashboard/dashboard/quick_actions.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade50,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Traffic Management Dashboard",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Live monitoring and analytics",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.notifications),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/user_icon.png"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: "Total Vehicles",
                  subtitle: "12.5%",
                  icon: Icons.directions_car,
                  iconColor: Colors.blue,
                  subtitleColor: Colors.green,
                ),
                InfoCard(
                  title: "Active Cameras",
                  subtitle: "All Systems Active",
                  icon: Icons.videocam,
                  iconColor: Colors.purple,
                  subtitleColor: Colors.green,
                ),
                InfoCard(
                  title: "Incidents Today",
                  subtitle: "3 Active",
                  icon: Icons.error,
                  iconColor: Colors.red,
                  subtitleColor: Colors.red,
                ),
                InfoCard(
                  title: "Traffic Flow",
                  subtitle: "Updated 2m ago",
                  icon: Icons.compare_arrows,
                  iconColor: Colors.green,
                  subtitleColor: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Live Camera Feeds",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: CameraCard(
                                  location: "Intersection A",
                                  vehicleCount: 127,
                                  avgSpeed: 42,
                                  status: "GREEN",
                                  imagePath: "assets/images/traffic1.jpg",
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CameraCard(
                                  location: "Highway B",
                                  vehicleCount: 243,
                                  avgSpeed: 78,
                                  status: "MEDIUM",
                                  imagePath: "assets/images/traffic2.jpg",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "AI Safety Analysis",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Column(
                            children: [
                              SafetyCard(
                                title: "Accident Risk",
                                subtitle: "Based on current conditions",
                                status: "LOW",
                                icon: Icons.car_crash,
                                iconColor: Colors.red,
                                statusColor: Colors.green,
                              ),
                              SizedBox(height: 10),
                              SafetyCard(
                                title: "Speed Compliance",
                                subtitle: "Average compliance rate",
                                status: "95%",
                                icon: Icons.speed,
                                iconColor: Colors.blue,
                                statusColor: Colors.blue,
                              ),
                              SizedBox(height: 10),
                              SafetyCard(
                                title: "Signal Compliance",
                                subtitle: "Last hour analysis",
                                status: "98%",
                                icon: Icons.traffic,
                                iconColor: Colors.orange,
                                statusColor: Colors.blue,
                              ),
                              SizedBox(height: 10),
                              SafetyCard(
                                title: "Pedestrian Safety",
                                subtitle: "Crossing compliance",
                                status: "SAFE",
                                icon: Icons.people,
                                iconColor: Colors.purple,
                                statusColor: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                //Live Alerts
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Live Alerts",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            LiveAlertCard(
                              title: "Traffic Accident",
                              description:
                                  "Major collision on Highway 101, emergency response deployed.",
                              timeAgo: "2m ago",
                              backgroundColor: Colors.red[50],
                              titleColor: Colors.red,
                            ),
                            const SizedBox(height: 8),
                            LiveAlertCard(
                              title: "Heavy Congestion",
                              description:
                                  "Downtown area experiencing unusual traffic buildup.",
                              timeAgo: "5m ago",
                              backgroundColor: Colors.yellow[50],
                              titleColor: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      QuickActions(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color subtitleColor;

  const InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: subtitleColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraCard extends StatelessWidget {
  final String location;
  final int vehicleCount;
  final int avgSpeed;
  final String status;
  final String imagePath;

  const CameraCard({
    required this.location,
    required this.vehicleCount,
    required this.avgSpeed,
    required this.status,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Live - $location',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Vehicle Count: $vehicleCount',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            'Avg Speed: $avgSpeed km/h',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            'Flow Status: $status',
            style: TextStyle(
              fontSize: 12,
              color: status == "GREEN" ? Colors.green : Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class SafetyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final IconData icon;
  final Color iconColor;
  final Color statusColor;

  const SafetyCard({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
    required this.iconColor,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class LiveAlertCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeAgo;
  final Color? backgroundColor;
  final Color? titleColor;

  const LiveAlertCard({
    required this.title,
    required this.description,
    required this.timeAgo,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Colors.black,
                ),
              ),
              Text(
                timeAgo,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
