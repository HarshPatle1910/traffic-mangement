import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard/dashboard_screen.dart';
import 'navigation_sidebar.dart';

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
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            // Sidebar
            Expanded(
              // flex: 2,
              child: NavigationSidebar(controller: _controller),
            ),
            // Main Content Area
            Expanded(
              flex: 5,
              child: Obx(() {
                switch (_controller.currentPage.value) {
                  case 'Dashboard':
                    return DashboardScreen();
                  case 'Analytics':
                    return MainDashboardContent();
                  case 'Alerts':
                    return MainDashboardContent();
                  case 'Cameras':
                    return MainDashboardContent();
                  case 'Settings':
                    return MainDashboardContent();
                  default:
                    return MainDashboardContent();
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to the Settings!",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
