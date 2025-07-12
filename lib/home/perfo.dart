import 'package:bountenadmin/home/dash.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MemberPerformanceScreen(),
//   ));
// }

class MemberPerformanceScreen extends StatelessWidget {
  final List<Map<String, String>> affiliates = List.generate(5, (index) {
    return {
      'name': 'Aurelia Nightshade',
      'phone': '+1 (555) 123-4567',
      'location': 'Coppell, Virginia',
      'product': 'Gadget Pro 2023',
      'commission': '₹ 237',
    };
  });

  Widget statCard(String value, String label, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.blue),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(label, style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget affiliateCard(Map<String, String> affiliate) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              affiliate['name']!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(affiliate['phone']!),
            Text(affiliate['location']!),
            SizedBox(height: 6),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Product : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: affiliate['product']!),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Commission\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: affiliate['commission']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      drawer: AppDrawer(),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Members Performance and payout",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2.5,
              children: [
                statCard("15,678", "Total Traffic", Icons.show_chart),
                statCard("15,678", "Total Leads", Icons.people),
                statCard(
                  "₹12,345",
                  "Total Earnings",
                  Icons.account_balance_wallet,
                ),
                statCard("56", "Pending Leads", Icons.pending),
              ],
            ),

            SizedBox(height: 20),
            Text(
              "Affiliates",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Affiliate Cards
            ListView.builder(
              itemCount: affiliates.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return affiliateCard(affiliates[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
