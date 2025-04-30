import 'package:flutter/material.dart';

class CommandCenterPage extends StatelessWidget {
  const CommandCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            const Text(
              'Command Center',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 30),
            _navItem('Dashboard'),
            _navItem('Traffic Control'),
            _navItem('Emergency Detection'),
            _navItem('Analytics'),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Panel
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildCard(
                    title: 'Real-Time Alerts',
                    trailing: Chip(
                      label: const Text('4 Active'),
                      backgroundColor: Colors.red.shade100,
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                    child: Column(
                      children: [
                        _alertTile(
                          title: 'Multi-Vehicle Collision',
                          subtitle:
                              'I-95 South, Exit 67 near Thompson Bridge\n3 min ago',
                          color: Colors.red,
                          status: 'Confirmed',
                        ),
                        _alertTile(
                          title: 'Commercial Vehicle Fire',
                          subtitle: 'Downtown, 5th & Madison Ave\n7 min ago',
                          color: Colors.orange,
                          status: 'Responding',
                        ),
                        _alertTile(
                          title: 'Building Alarm',
                          subtitle:
                              'West End Mall, Security Level B2\n12 min ago',
                          color: Colors.blue,
                          status: 'Investigating',
                        ),
                        _alertTile(
                          title: 'Medical Emergency',
                          subtitle: 'Central Station, Platform 3\n23 min ago',
                          color: Colors.green,
                          status: 'Cleared',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    title: 'Response Time Monitor',
                    child: Column(
                      children: [
                        _responseMetric(
                          'Average Response Time',
                          4.2,
                          Colors.green,
                          'Improved by 12% from last week',
                        ),
                        _responseMetric(
                          'Target Response Time',
                          5.0,
                          Colors.blue,
                          'City standard benchmark',
                        ),
                        _responseMetric(
                          'Peak Hour Performance',
                          6.3,
                          Colors.orange,
                          'Needs improvement (4-6 PM)',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Right Panel
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildCard(
                    title: 'Emergency Route Optimization',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          children: const [
                            Chip(
                              label: Text('Ambulances'),
                              avatar: Icon(Icons.local_hospital, size: 16),
                            ),
                            Chip(
                              label: Text('Fire Trucks'),
                              avatar: Icon(Icons.fire_truck, size: 16),
                            ),
                            Chip(
                              label: Text('Police'),
                              avatar: Icon(Icons.local_police, size: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.map, size: 48, color: Colors.grey),
                              SizedBox(height: 8),
                              Text(
                                'Map Image Placeholder',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    title: 'Case Log History',
                    trailing: const Text(
                      'Export Log',
                      style: TextStyle(color: Colors.blue),
                    ),
                    child: Column(
                      children: [
                        _caseLogRow(
                          '10:23 AM',
                          'Multi-Vehicle Collision',
                          'I-95 South, Exit 67',
                          '4.5 min',
                          'Cleared',
                        ),
                        _caseLogRow(
                          '09:45 AM',
                          'Medical Emergency',
                          'Central Park, East Entrance',
                          '3.2 min',
                          'Cleared',
                        ),
                        _caseLogRow(
                          '09:12 AM',
                          'Building Fire Alarm',
                          'West End Mall',
                          '5.7 min',
                          'Cleared',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String label) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(label, style: const TextStyle(color: Colors.black54)),
  );

  Widget _buildCard({
    required String title,
    Widget? trailing,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _alertTile({
    required String title,
    required String subtitle,
    required Color color,
    required String status,
  }) {
    return ListTile(
      leading: CircleAvatar(radius: 6, backgroundColor: color),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }

  Widget _responseMetric(String label, double value, Color color, String note) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$label: ${value.toStringAsFixed(1)} min'),
              Text(note, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value / 10,
            backgroundColor: color.withOpacity(0.2),
            color: color,
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  Widget _caseLogRow(
    String time,
    String incident,
    String location,
    String responseTime,
    String status,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(time, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(flex: 2, child: Text(incident)),
          Expanded(flex: 3, child: Text(location)),
          SizedBox(width: 70, child: Text(responseTime)),
          Chip(
            label: Text(status),
            backgroundColor: Colors.green.shade100,
            labelStyle: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
