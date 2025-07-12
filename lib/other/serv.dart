// A basic Flutter app structure that includes three screens: Reports, Video Manager, and Services
import 'package:flutter/material.dart';

// void main() => runApp(BountenApp());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bounten Admin')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ReportsScreen()),
            ),
            child: Text("Reports"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VideoManagerScreen()),
            ),
            child: Text("Videos"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ServicesScreen()),
            ),
            child: Text("Services"),
          ),
        ],
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {"title": "Traffic", "value": "12,000"},
    {"title": "Leads", "value": "1,000"},
    {"title": "Affiliate performance", "value": "70%"},
    {"title": "Payout Data", "value": "₹1,25,000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reports")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(report["title"]!),
              subtitle: Text("Data\n${report["value"]}"),
              trailing: Icon(Icons.download),
            ),
          );
        },
      ),
    );
  }
}

class VideoManagerScreen extends StatelessWidget {
  final List<String> videoTitles = [
    "Unlocking the...",
    "Data: A Com...",
    "Maximizing Y...",
    "Understanding...",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Services with Bounten")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add Video"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videoTitles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                  ),
                  title: Text(videoTitles[index]),
                  trailing: Icon(Icons.delete),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {"name": "Unlocking t...", "videos": 12},
    {"name": "Data: A Co...", "videos": 12},
    {"name": "Maximizing...", "videos": 12},
    {"name": "Understandin...", "videos": 12},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Services")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add Service"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                  ),
                  title: Text(service["name"]),
                  subtitle: Text("${service["videos"]} videos"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
