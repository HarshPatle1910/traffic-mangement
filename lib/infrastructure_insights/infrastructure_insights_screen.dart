import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfrastructureInsightsScreen extends StatelessWidget {
  const InfrastructureInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade50,
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Infrastructure Insights",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(width: 20),
                  Text("Dashboard", style: TextStyle(color: Colors.blue)),
                  SizedBox(width: 10),
                  Text("Analytics"),
                  SizedBox(width: 10),
                  Text("Reports"),
                  Spacer(),
                  Icon(Icons.notifications),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/user_icon.png"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DashboardWidget(
                    icon: Icon(
                      FontAwesomeIcons.triangleExclamation,
                      color: Colors.redAccent,
                      size: 16,
                    ),
                    title: "Total Issues",
                    value: 247,
                    changeText: "+12% from last month",
                    changeColor: Colors.green,
                  ),
                  SizedBox(width: 16),
                  DashboardWidget(
                    icon: Icon(
                      FontAwesomeIcons.circleCheck,
                      color: Colors.green,
                      size: 16,
                    ),
                    title: "Resolved",
                    value: 156,
                    changeText: "+8% from last month",
                    changeColor: Colors.green,
                  ),
                  SizedBox(width: 16),
                  DashboardWidget(
                    icon: Icon(
                      FontAwesomeIcons.clock,
                      color: Colors.orange,
                      size: 16,
                    ),
                    title: "Pending",
                    value: 91,
                    changeText: "+15% from last month",
                    changeColor: Colors.red,
                  ),
                  SizedBox(width: 16),
                  DashboardWidget(
                    icon: Icon(
                      FontAwesomeIcons.bug,
                      color: Colors.redAccent,
                      size: 16,
                    ),
                    title: "Critical Issues",
                    value: 24,
                    changeText: "+5% from last month",
                    changeColor: Colors.red,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Infrastructure Heatmap",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text("Filter"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text("Export"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Map Area (replace with actual map later)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 300,
                          width: 900,
                          color: Colors.grey.shade200,
                          child: Image.asset(
                            'assets/images/maps.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Legend
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          LegendDot(color: Colors.red, label: "Critical"),
                          SizedBox(width: 12),
                          LegendDot(color: Colors.orange, label: "Moderate"),
                          SizedBox(width: 12),
                          LegendDot(color: Colors.green, label: "Minor"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              PriorityIssuesCard(),
              SizedBox(height: 24),
              ReportIssueCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final int value;
  final String changeText;
  final Color changeColor;

  const DashboardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.changeText,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
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
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              icon,
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "$value",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(changeText, style: TextStyle(fontSize: 12, color: changeColor)),
        ],
      ),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Priority Issues Card
class PriorityIssuesCard extends StatelessWidget {
  const PriorityIssuesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Priority Issues",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _issueTile(
            "Critical",
            "Junction 14: Road Wear",
            "Schedule resurfacing within 7 days",
            Colors.red.shade100,
            9.8,
          ),
          const SizedBox(height: 12),
          _issueTile(
            "Moderate",
            "Street Light Malfunction",
            "Replace bulbs in sector B-12",
            Colors.orange.shade100,
            7.5,
          ),
          const SizedBox(height: 12),
          _issueTile(
            "Minor",
            "Traffic Sign Cleaning",
            "Maintenance required at Route 27",
            Colors.green.shade100,
            5.2,
          ),
        ],
      ),
    );
  }

  Widget _issueTile(
    String level,
    String title,
    String subtitle,
    Color color,
    double score,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            score.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// Report Issue Card
class ReportIssueCard extends StatelessWidget {
  const ReportIssueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Report Issue",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          // Drag and drop (placeholder box)
          DottedBorderBox(),
          const SizedBox(height: 12),
          // Description
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Add description or comments...",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Submit Report"),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable dotted box (placeholder for file upload)
class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade50,
      ),
      child: const Center(
        child: Text.rich(
          TextSpan(
            text: "Drag and drop files here or ",
            children: [
              TextSpan(
                text: "browse files",
                style: TextStyle(color: Colors.blue),
              ),
            ],
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

// Shared BoxDecoration
BoxDecoration _boxStyle() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
