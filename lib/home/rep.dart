import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  final List<Map<String, String>> reportData = const [
    {"title": "Traffic", "value": "12,000"},
    {"title": "Leads", "value": "1,000"},
    {"title": "Affiliate performance", "value": "70%"},
    {"title": "Payout Data", "value": "₹1,25,000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 7),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Image.asset('assets/logo2.jpg', height: 40),
        backgroundColor: Colors.white,
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.from(
                  alpha: 1,
                  red: 0.416,
                  green: 0.624,
                  blue: 0.988,
                ),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(30),
            ),

            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
              radius: 15,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Container(
                padding: EdgeInsets.all(10),
                // color: Colors.white,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Affiliate Payouts",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blacki,
                        // color: blacki
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reportData.length,
              itemBuilder: (context, index) {
                final report = reportData[index];
                return ReportCard(
                  title: report['title']!,
                  value: report['value']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String value;

  const ReportCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3),
      // elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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

                IconButton(
                  icon: const Icon(Icons.download_rounded, color: Colors.blue),
                  onPressed: () {},
                  tooltip: "Download",
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Text("Data", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
