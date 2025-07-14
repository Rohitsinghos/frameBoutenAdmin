import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class AffiliatePayoutPage extends StatefulWidget {
  const AffiliatePayoutPage({super.key});

  @override
  State<AffiliatePayoutPage> createState() => _AffiliatePayoutPageState();
}

class _AffiliatePayoutPageState extends State<AffiliatePayoutPage> {
  int cp = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 6),
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
        padding: const EdgeInsets.all(10.0),
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
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const AffiliateCard(
                    name: "Aurelia Nightshade",
                    phone: "+1 (555) 123-4567",
                    payout: "₹12,001",
                  );
                },
              ),
            ),
            SizedBox(height: 2),
            Card(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12),
              //   color: Colors.white,
              // ),
              color: Colors.white,
              child: Center(
                child: Row(
                  spacing: 8,
                  children: List.generate(7, (ind) {
                    int index = cp - 2 + ind;
                    if (ind == 0 || ind == 6) {
                      return IconButton(
                        style: ButtonStyle(),
                        icon: Icon(
                          ind == 0 ? Icons.chevron_left : Icons.chevron_right,
                          // size: 10,
                        ),
                        onPressed: () {
                          if (cp == 1 && ind == 0) {
                            return;
                          }

                          ind == 0 ? cp-- : cp++;

                          setState(() {});
                        },
                      );
                    } else if (ind == 5) {
                      return Text("...");
                    } else if (index < 1) {
                      return SizedBox(width: 40);
                    } else {
                      return GestureDetector(
                        onTap: () {
                          cp = cp + ind - 2;
                          setState(() {});
                        },
                        child: Container(
                          width: 40,
                          decoration: (index == cp)
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    (index == -1) ? 12 : 0,
                                  ),
                                  border: Border.all(
                                    width: (index == 2) ? 0.5 : 0,
                                  ),
                                )
                              : BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              // horizontal: 15,
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${index}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AffiliateCard extends StatelessWidget {
  final String name;
  final String phone;
  final String payout;

  const AffiliateCard({
    super.key,
    required this.name,
    required this.phone,
    required this.payout,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(phone),
                ],
              ),
            ),
            Text(payout, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
