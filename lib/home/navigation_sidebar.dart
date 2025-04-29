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
                  title: "Traffic Feed",
                  icon: Icons.traffic,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Infrastructure Insights",
                  icon: Icons.insights,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Settings and Integration",
                  icon: Icons.settings,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Traffic Guard",
                  icon: Icons.directions_transit_filled,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Smart Signal Control",
                  icon: Icons.signal_wifi_statusbar_4_bar_outlined,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Traffic Priority Screen",
                  icon: Icons.low_priority_outlined,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Command Centre Page",
                  icon: Icons.keyboard_command_key,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Traffic Violation Monitor",
                  icon: Icons.screenshot_monitor,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "EV Analytics Dashboard  ",
                  icon: Icons.ev_station,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
