import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home/responsive_scaffold.dart';

void main() {
  runApp(TrafficManagementApp());
}

class TrafficManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Traffic Management Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // home: TrafficGaurdPage(),
      home: ResponsiveScaffold(),
      // home: ReportsExportsScreen(),
    );
  }
}
