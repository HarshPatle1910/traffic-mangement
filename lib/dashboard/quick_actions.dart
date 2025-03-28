import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
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
          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              QuickActionButton(
                title: "Record Event",
                icon: Icons.videocam,
                iconColor: Colors.blue,
              ),
              QuickActionButton(
                title: "Send Alert",
                icon: Icons.notifications,
                iconColor: Colors.orange,
              ),
              QuickActionButton(
                title: "Export Data",
                icon: Icons.file_download,
                iconColor: Colors.green,
              ),
              QuickActionButton(
                title: "Share Report",
                icon: Icons.share,
                iconColor: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;

  const QuickActionButton({
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add functionality here if needed
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: iconColor),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
