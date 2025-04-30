import 'package:flutter/material.dart';

class TrafficViolationMonitor extends StatelessWidget {
  final List<Map<String, String>> violations = [
    {
      "time": "2025-03-15 14:30",
      "location": "Main St & 5th Ave",
      "type": "No Helmet",
      "vehicle": "KA-01-AB-1234",
      "status": "Fine Issued",
      "evidenceType": "Image",
      "capturedBy": "CCTV",
      "capturedDate": "2025-03-14",
      "evidenceLink": "https://example.com/evidence1.jpg",
    },
    {
      "time": "2025-03-15 14:25",
      "location": "Broadway & 7th",
      "type": "Signal Jump",
      "vehicle": "KA-01-CD-5678",
      "status": "Pending",
      "evidenceType": "Video",
      "capturedBy": "Officer John",
      "capturedDate": "2025-03-13",
      "evidenceLink": "https://example.com/evidence2.mp4",
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Fine Issued":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget buildViolationCard(Map<String, String> v) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image_not_supported, color: Colors.grey[700]),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${v['location']} • ${v['type']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(v['time']!),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(v['vehicle']!),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: getStatusColor(v['status']!).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  v['status']!,
                  style: TextStyle(
                    color: getStatusColor(v['status']!),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(),
          Text(
            "Evidence Type: ${v['evidenceType']}",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Captured By: ${v['capturedBy']}",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Captured Date: ${v['capturedDate']}",
            style: TextStyle(fontSize: 14),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Evidence Link: ", style: TextStyle(fontSize: 14)),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    v['evidenceLink']!,
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSummaryCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget buildFilterRow() {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        DropdownButton<String>(
          value: 'All Violations',
          items:
              ['All Violations', 'No Helmet', 'Signal Jump']
                  .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                  .toList(),
          onChanged: (_) {},
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.calendar_today),
          label: Text('Date Range'),
          onPressed: () {},
        ),
        SizedBox(
          width: 180,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.directions_car),
              labelText: 'Vehicle Number',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 180,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_on),
              labelText: 'Location',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(icon: Icon(Icons.download), onPressed: () {}),
        TextButton(onPressed: () {}, child: Text("Export Data")),
        IconButton(icon: Icon(Icons.email), onPressed: () {}),
        TextButton(onPressed: () {}, child: Text("Email Report")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Traffic Violation Monitor",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              buildFilterRow(),
              SizedBox(height: 16),
              Row(
                children: [
                  buildSummaryCard("Total Violations", "1,234", Colors.red),
                  SizedBox(width: 10),
                  buildSummaryCard("Fines Issued", "856", Colors.green),
                  SizedBox(width: 10),
                  buildSummaryCard("Pending Review", "378", Colors.orange),
                  SizedBox(width: 10),
                  buildSummaryCard("Collection Rate", "69.3%", Colors.blue),
                ],
              ),
              SizedBox(height: 24),
              Text(
                "Evidence Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: violations.length,
                  itemBuilder:
                      (context, index) => buildViolationCard(violations[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
