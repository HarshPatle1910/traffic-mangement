import 'package:flutter/material.dart';
import 'package:traffic_management_dashboard/home/responsive_scaffold.dart';
import 'package:traffic_management_dashboard/home/sidebar_menu_item.dart';

class NavigationSidebar extends StatelessWidget {
  final DashboardController controller;

  const NavigationSidebar({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo/Header
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade700,
            child: Row(
              children: [
                const Icon(Icons.shield, color: Colors.white),
                const SizedBox(width: 10),
                const Text(
                  "ZeexAI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Navigation Menu
          Expanded(
            child: ListView(
              children: [
                SidebarMenuItem(
                  title: "Dashboard",
                  icon: Icons.dashboard,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Analytics",
                  icon: Icons.analytics,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Alerts",
                  icon: Icons.add_alert_sharp,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Cameras",
                  icon: Icons.camera_alt_sharp,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Settings",
                  icon: Icons.settings,
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
