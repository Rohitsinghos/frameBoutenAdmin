import 'package:bountenadmin/home/dash.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:bountenadmin/other/pdf.dart';
import 'package:flutter/material.dart';
// import 'package:bountenadmin/compo/extra.dart';
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

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  final int page;
  AppDrawer({required this.page});

  TextStyle txs(int pag) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: (page == pag) ? adth : blacki,
    );
  }

  Color gcl(int pag) {
    return (page == pag) ? adth : blacki;
  }

  bool other = false;
  @override
  Widget build(BuildContext context) {
    // page = widget.page;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Icon(Icons.cancel, size: 30, color: adth),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          // DrawerHeader(child: Text("Bounten Menu")),
          Container(
            decoration: (page == 1)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 1) ? Icons.dashboard : Icons.dashboard_outlined,
                color: gcl(1),
              ),
              title: Text("Dashboard", style: txs(1)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                  (context) => false,
                );
              },
            ),
          ),

          Container(
            decoration: (page == 2)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 2) ? Icons.person : Icons.person_outline,
                color: gcl(2),
              ),
              title: Text("Affiliate Management", style: txs(2)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AffiliateListScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: (page == 3)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 3)
                    ? Icons.manage_accounts
                    : Icons.manage_accounts_outlined,
                color: gcl(3),
              ),
              title: Text("Lead Management", style: txs(3)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeadManagementPage()),
                );
              },
            ),
          ),
          Container(
            decoration: (page == 4)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 4) ? Icons.shopping_bag : Icons.shopping_bag_outlined,
                color: gcl(4),
              ),
              title: Text("Products", style: txs(4)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
            ),
          ),
          Container(
            decoration: (page == 5)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 5) ? Icons.people : Icons.people_outline,
                color: gcl(5),
              ),
              title: Text("Staff Members", style: txs(5)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaffPage()),
                );
              },
            ),
          ),
          Container(
            decoration: (page == 6)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 6) ? Icons.payment : Icons.payment_outlined,
                color: gcl(6),
              ),
              title: Text(style: txs(6), "Payouts"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AffiliatePayoutPage(),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: (page == 7)
                ? BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(),
            child: ListTile(
              leading: Icon(
                (page == 7) ? Icons.bar_chart : Icons.bar_chart_outlined,
                color: gcl(7),
              ),
              title: Text(style: txs(7), "Reports"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportsPage()),
                );
              },
            ),
          ),

          Container(
            // decoration:  BoxDecoration(),
            child: ExpansionTile(
              // internalAddSemanticForOnTap: StepStyle(),
              // backgroundColor: bg,
              // leading: Icon(Icons.layers, color: (page >= 8) ? adth : blacki),
              expansionAnimationStyle: AnimationStyle(
                duration: Duration(seconds: 5),
              ),
              initiallyExpanded: (page >= 8),

              // onExpansionChanged: (value) {},
              title: Text(
                "Others",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: (page >= 8) ? adth : blacki,
                ),
              ),
              children: [
                Container(
                  decoration: (page == 8)
                      ? BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : BoxDecoration(),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: Text("Journey With Bounten", style: txs(8)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JourneyScreen(),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  decoration: (page == 9)
                      ? BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : BoxDecoration(),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: Text("Services", style: txs(9)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicesScreen(),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  decoration: (page == 10)
                      ? BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : BoxDecoration(),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: Text("Installations", style: txs(10)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InstallPage()),
                      );
                    },
                  ),
                ),

                Container(
                  decoration: (page == 11)
                      ? BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : BoxDecoration(),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: Text("PDF", style: txs(11)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PdfScreen()),
                      );
                    },
                  ),
                ),

                Container(
                  decoration: (page == 12)
                      ? BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : BoxDecoration(),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    title: Text("FAQ's", style: txs(12)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FAQPage()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

          SizedBox(height: 30),
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
      title: Text(title, style: TextStyle(color: adth)),
      onTap: () {},
    );
  }
}
