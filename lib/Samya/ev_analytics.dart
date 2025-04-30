import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EVAnalyticsDashboard extends StatelessWidget {
  const EVAnalyticsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "EV Analytics",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryCards(),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildEVAdoptionChart()),
                const SizedBox(width: 16),
                Expanded(child: _buildVehicleDistribution()),
              ],
            ),
            const SizedBox(height: 20),
            _buildSustainabilityTable(),
            const SizedBox(height: 20),
            _buildDownloadCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _summaryCard(
          "EV Vehicles Today",
          "1,234",
          "+12.3% from yesterday",
          Icons.directions_car,
          Colors.green,
        ),
        _summaryCard(
          "Carbon Saved (Today)",
          "4.2",
          "tons of CO₂",
          Icons.eco,
          Colors.blue,
        ),
        _summaryCard(
          "Active Stations",
          "89",
          "98% operational",
          Icons.ev_station,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _summaryCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEVAdoptionChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EV Adoption Trend",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ToggleButtons(
              isSelected: [true, false],
              children: const [Text("Weekly"), Text("Monthly")],
              onPressed: (_) {},
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 200),
                        FlSpot(2, 300),
                        FlSpot(3, 450),
                        FlSpot(4, 500),
                        FlSpot(5, 600),
                        FlSpot(6, 750),
                      ],
                      isCurved: true,
                      dotData: FlDotData(show: true),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleDistribution() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vehicle Distribution",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: CircularPercentIndicator(
                radius: 60,
                lineWidth: 10,
                percent: 0.35,
                center: const Text(
                  "35%\nEV Adoption",
                  textAlign: TextAlign.center,
                ),
                progressColor: Colors.green,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSustainabilityTable() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sustainability Leaderboard",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DataTable(
              columns: const [
                DataColumn(label: Text("Intersection")),
                DataColumn(label: Text("EV Count")),
                DataColumn(label: Text("CO₂ Saved")),
                DataColumn(label: Text("Trend")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("Central Station")),
                    DataCell(Text("456")),
                    DataCell(Text("1.2 tons")),
                    DataCell(Text("+12.3%")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Downtown Cross")),
                    DataCell(Text("389")),
                    DataCell(Text("0.9 tons")),
                    DataCell(Text("+8.7%")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("West Bridge")),
                    DataCell(Text("298")),
                    DataCell(Text("0.7 tons")),
                    DataCell(Text("+5.2%")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Carbon Impact Report",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text("PDF"),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.grid_on),
                  label: const Text("Excel"),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
