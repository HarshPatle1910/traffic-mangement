import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traffic_management_dashboard/Samya/command_centre_page.dart';
import 'package:traffic_management_dashboard/Samya/settings_integration_app.dart';
import 'package:traffic_management_dashboard/home/navigation_sidebar.dart';

import '../Samya/ev_analytics.dart';
import '../Samya/report_export_screen.dart';
import '../Samya/smart_signal_control.dart';
import '../dashboard/dashboard_screen.dart';
import '../infrastructure_insights/infrastructure_insights_screen.dart';
import '../traffic_screens/traffic.dart';
import '../traffic_screens/traffic_priority_screen.dart';
import '../traffic_screens/traffic_violation_monitor.dart';

class DashboardController extends GetxController {
  var currentPage = 'Dashboard'.obs;

  void updatePage(String page) {
    currentPage.value = page;
  }
}

class ResponsiveScaffold extends StatelessWidget {
  final DashboardController _controller = Get.put(DashboardController());

  ResponsiveScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          "ZeexAI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: NavigationSidebar(controller: _controller),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Obx(() {
                switch (_controller.currentPage.value) {
                  case 'Dashboard':
                    return DashboardScreen();
                  case 'Traffic Feed':
                    return ReportsExportsScreen();
                  case 'Infrastructure Insights':
                    return InfrastructureInsightsScreen();
                  case 'Settings and Integration':
                    return SettingsIntegrationApp();
                  case 'Traffic Guard':
                    return TrafficGuardDashboard();
                  case 'Smart Signal Control':
                    return SmartSignalControl();
                  case 'Traffic Priority Screen':
                    return TrafficPriorityScreen();
                  case 'Command Centre Page':
                    return CommandCenterPage();
                  case 'Traffic Violation Monitor':
                    return TrafficViolationMonitor();
                  case 'EV Analytics Dashboard':
                    return EVAnalyticsDashboard();

                  case 'Analytics':
                    return MainDashboardContent();
                  case 'Alerts':
                    return MainDashboardContent();
                  case 'Cameras':
                    return MainDashboardContent();

                  default:
                    return MainDashboardContent(
                      message: "Page not found or under construction.",
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class MainDashboardContent extends StatelessWidget {
  final String message;
  MainDashboardContent({this.message = "Welcome to the Dashboard!"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
