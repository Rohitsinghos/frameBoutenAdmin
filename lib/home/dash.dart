import 'package:bountenadmin/compo/extra.dart';
import 'package:bountenadmin/home/affi.dart';
import 'package:bountenadmin/other/faq.dart';
import 'package:bountenadmin/other/install.dart';
import 'package:bountenadmin/other/journ.dart';
import 'package:bountenadmin/home/lead.dart';
import 'package:bountenadmin/home/prod.dart';
import 'package:bountenadmin/home/pyou.dart';
import 'package:bountenadmin/home/rep.dart';
import 'package:bountenadmin/home/staf.dart';
import 'package:bountenadmin/other/serv.dart';
import 'package:flutter/material.dart';

// void main() {
// runApp(BountenApp());
// }

class BountenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bounten Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Stats Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2,
              children: [
                dashboardCard("15,678", "Total Traffic", Icons.traffic),
                dashboardCard("15,678", "Total Leads", Icons.leaderboard),
                dashboardCard("56", "Total Affiliates", Icons.group),
                dashboardCard("₹12,345", "Total Payout", Icons.attach_money),
              ],
            ),
            SizedBox(height: 20),

            // Add Lead Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
              label: Text("Add Lead", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),

            SizedBox(height: 20),

            // Tabs
            // TabBar(
            //   labelColor: Colors.blue,
            //   unselectedLabelColor: Colors.black,
            //   indicatorColor: Colors.blue,
            //   tabs: [
            //     Tab(text: "All leads"),
            //     Tab(text: "Poor Quality"),
            //     Tab(text: "Low Quality"),
            //     Tab(text: "High Quality"),
            //   ],
            // ),
            SizedBox(height: 12),

            // Data Table
            Container(
              child: DataTable(
                columnSpacing: 2,
                columns: const [
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Product")),
                  DataColumn(label: Text("Lead \nQuality")),
                ],
                rows: List.generate(
                  6,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text("Samuel Peterson")),
                      DataCell(Text("Gadget Pro 2023")),
                      DataCell(
                        Text(
                          index == 1
                              ? "High Quality"
                              : index == 2
                              ? "Low Quality"
                              : "Poor Quality",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(String title, String subtitle, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 50),
          // DrawerHeader(child: Text("Bounten Menu")),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 240, 249),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Affiliate Management"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AffiliateListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text("Lead Management"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeadManagementPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Products"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Staff Members"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StaffPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Payouts"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AffiliatePayoutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Reports"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsPage()),
              );
            },
          ),

          ExpansionTile(
            leading: Icon(Icons.layers),
            title: Text("Others"),
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                title: Text(
                  "Journey With Bounten",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JourneyScreen()),
                  );
                },
              ),

              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                title: Text("Services", style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesScreen()),
                  );
                },
              ),

              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                title: Text(
                  "Installations",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstallPage()),
                  );
                },
              ),

              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                title: Text("PDF", style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQPage()),
                  );
                },
              ),

              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                title: Text("FAQ's", style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerTile(IconData icon, String title) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: () {});
  }

  Widget drawerSubItem(String title) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 72),
      title: Text(title, style: TextStyle(color: Colors.blue)),
      onTap: () {},
    );
  }
}

// import 'package:bountenadmin/compo/extra.dart';
// import 'package:bountenadmin/home/affi.dart';
// import 'package:bountenadmin/other/faq.dart';
// import 'package:bountenadmin/other/install.dart';
// import 'package:bountenadmin/other/journ.dart';
// import 'package:bountenadmin/home/lead.dart';
// import 'package:bountenadmin/home/prod.dart';
// import 'package:bountenadmin/home/pyou.dart';
// import 'package:bountenadmin/home/rep.dart';
// import 'package:bountenadmin/home/staf.dart';
// import 'package:bountenadmin/other/serv.dart';
// import 'package:flutter/material.dart';

// // void main() {
// // runApp(BountenApp());
// // }

// class BountenApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bounten Dashboard',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: DashboardScreen(),
//     );
//   }
// }

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Draww(),
//       appBar: apb,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Stats Cards
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 2,
//               children: [
//                 dashboardCard("15,678", "Total Traffic", Icons.traffic),
//                 dashboardCard("15,678", "Total Leads", Icons.leaderboard),
//                 dashboardCard("56", "Total Affiliates", Icons.group),
//                 dashboardCard("₹12,345", "Total Payout", Icons.attach_money),
//               ],
//             ),
//             SizedBox(height: 20),

//             // Add Lead Button
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text("Add Lead", style: TextStyle(color: Colors.white)),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//             ),

//             SizedBox(height: 20),

//             // Tabs
//             // TabBar(
//             //   labelColor: Colors.blue,
//             //   unselectedLabelColor: Colors.black,
//             //   indicatorColor: Colors.blue,
//             //   tabs: [
//             //     Tab(text: "All leads"),
//             //     Tab(text: "Poor Quality"),
//             //     Tab(text: "Low Quality"),
//             //     Tab(text: "High Quality"),
//             //   ],
//             // ),
//             // SizedBox(height: 12),

//             // Data Table
//             Container(
//               child: DataTable(
//                 columnSpacing: 16,
//                 columns: const [
//                   DataColumn(label: Text("Name")),
//                   DataColumn(label: Text("Product")),
//                   DataColumn(label: Text("Lead Quality")),
//                 ],
//                 rows: List.generate(
//                   6,
//                   (index) => DataRow(
//                     cells: [
//                       DataCell(Text("Samuel Peterson")),
//                       DataCell(Text("Gadget Pro 2023")),
//                       DataCell(
//                         Text(
//                           index == 1
//                               ? "High Quality"
//                               : index == 2
//                               ? "Low Quality"
//                               : "Poor Quality",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget AppDrawer() {
//   //   return
//   // }

//   // Widget drawerSubItem(String title) {
//   //   return
//   // }

//   Widget dashboardCard(String title, String subtitle, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             Icon(icon, size: 30, color: Colors.blue),
//             SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 Text(subtitle, style: TextStyle(fontSize: 12)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Draww extends StatelessWidget {
//   const Draww({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           SizedBox(height: 50),
//           // DrawerHeader(child: Text("Bounten Menu")),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 216, 240, 249),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListTile(
//               leading: Icon(Icons.dashboard),
//               title: Text("Dashboard"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DashboardScreen()),
//                 );
//               },
//             ),
//           ),

//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text("Affiliate Management"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AffiliateListScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.manage_accounts),
//             title: Text("Lead Management"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LeadManagementPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.shopping_bag),
//             title: Text("Products"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProductListScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.people),
//             title: Text("Staff Members"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => StaffPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.payment),
//             title: Text("Payouts"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AffiliatePayoutPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.bar_chart),
//             title: Text("Reports"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ReportsPage()),
//               );
//             },
//           ),

//           ExpansionTile(
//             leading: Icon(Icons.layers),
//             title: Text("Others"),
//             children: [
//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text(
//                   "Journey With Bounten",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => JourneyScreen()),
//                   );
//                 },
//               ),

//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text("Services", style: TextStyle(color: Colors.blue)),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ServicesScreen()),
//                   );
//                 },
//               ),

//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text(
//                   "Installations",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => InstallPage()),
//                   );
//                 },
//               ),

//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text("PDF", style: TextStyle(color: Colors.blue)),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FAQPage()),
//                   );
//                 },
//               ),

//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text("FAQ's", style: TextStyle(color: Colors.blue)),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FAQPage()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
