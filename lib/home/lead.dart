import 'package:bountenadmin/home/dash.dart';
import 'package:flutter/material.dart';

class LeadManagementPage extends StatelessWidget {
  const LeadManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Lead...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return LeadCard(
                    name: "Aurelia Nightshade",
                    phone: "+1 (555) 123-4567",
                    location: "Coppell, Virginia",
                    product: "Gadget Pro 2023",
                    leadQuality: "Poor Quality",
                    status: index == 1 ? "Rejected" : "Approved",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeadCard extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String product;
  final String leadQuality;
  final String status;

  const LeadCard({
    super.key,
    required this.name,
    required this.phone,
    required this.location,
    required this.product,
    required this.leadQuality,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == "Approved" ? Colors.green : Colors.red;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(phone),
            Text(location),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: "Product: ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: product,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: leadQuality,
                  items: const [
                    DropdownMenuItem(
                      value: "Poor Quality",
                      child: Text("Poor Quality"),
                    ),
                    DropdownMenuItem(
                      value: "Good Quality",
                      child: Text("Good Quality"),
                    ),
                  ],
                  onChanged: (_) {},
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: statusColor),
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
}
