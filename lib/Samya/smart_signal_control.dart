import 'package:flutter/material.dart';

class SmartSignalControl extends StatefulWidget {
  @override
  _SmartSignalControlState createState() => _SmartSignalControlState();
}

class _SmartSignalControlState extends State<SmartSignalControl> {
  String _selectedTrend = "7d";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Smart Signal Control",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Chip(
              label: Text(
                "System Active",
                style: TextStyle(color: Colors.green),
              ),
              backgroundColor: Color(0xFFE6F4EA),
            ),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              icon: const Icon(Icons.download, color: Colors.white),
              label: const Text(
                "Export Data",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Panel
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Intersection Grid",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.red,
                                ),
                                SizedBox(width: 4),
                                Text("High Traffic"),
                                SizedBox(width: 12),
                                CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.orange,
                                ),
                                SizedBox(width: 4),
                                Text("Moderate"),
                                SizedBox(width: 12),
                                CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.green,
                                ),
                                SizedBox(width: 4),
                                Text("Low Traffic"),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 200,
                              color: Colors.grey[200],
                              alignment: Alignment.center,
                              child: const Text(
                                "[Intersection Image Placeholder]",
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                statusCard(
                                  "Junction A1",
                                  "Active",
                                  Colors.green,
                                  "AI: Extend green for 20 sec",
                                ),
                                const SizedBox(width: 8),
                                statusCard(
                                  "Junction B2",
                                  "Moderate",
                                  Colors.orange,
                                  "AI: Switch to red in 10 sec",
                                ),
                                const SizedBox(width: 8),
                                statusCard(
                                  "Junction C3",
                                  "High Traffic",
                                  Colors.red,
                                  "AI: Maintain green signal",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Congestion Trends",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Last 7 Days",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children:
                                      ["24h", "7d", "30d"]
                                          .map(
                                            (e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 4.0,
                                                  ),
                                              child: ChoiceChip(
                                                label: Text(e),
                                                selected: _selectedTrend == e,
                                                onSelected: (val) {
                                                  if (val)
                                                    setState(
                                                      () => _selectedTrend = e,
                                                    );
                                                },
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 120),
                            const Center(
                              child: Text(
                                "[Chart Placeholder]",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Right Panel
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Signal Configuration",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Control Mode"),
                                Text("Auto/Manual"),
                              ],
                            ),
                            const Switch(value: false, onChanged: null),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[100],
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Force Red",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[100],
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Force Green",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Congestion Scores",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            congestionScore("Junction A1", Colors.green, "Low"),
                            congestionScore(
                              "Junction B2",
                              Colors.orange,
                              "Moderate",
                            ),
                            congestionScore("Junction C3", Colors.red, "High"),
                          ],
                        ),
                      ),
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

  Widget statusCard(String title, String status, Color color, String action) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: color, radius: 5),
                  const SizedBox(width: 6),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Chip(
                label: Text(status),
                backgroundColor: color.withOpacity(0.2),
              ),
              const SizedBox(height: 6),
              Text(action, style: const TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget congestionScore(String junction, Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(junction),
              Text(label, style: TextStyle(color: color)),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: 0.7,
            color: color,
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
