// import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class AffiliateListScreen extends StatelessWidget {
  final List<Map<String, String>> affiliates = List.generate(8, (index) {
    return {
      'name': 'Aurelia Nightshade',
      'phone': '+1 (555) 123-4567',
      'location': 'Coppell, Virginia',
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 2),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
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
                      "Affiliates",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blacki,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: adth),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      height: 50,
                      child: GestureDetector(
                        // padding: EdgeInsets.all(0),
                        // onHighlightChanged: false,
                        // highlightColor: Colors.white,
                        // p
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddAffiliateDialog(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 18, color: adth),
                            Text(
                              "Add Affiliate",
                              style: TextStyle(color: adth),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),

            // Search bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),

              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Affiliate...',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: adth, width: 0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),

            // Affiliate List
            Expanded(
              child: ListView.separated(
                itemCount: affiliates.length,
                separatorBuilder: (_, __) => SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final affiliate = affiliates[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  affiliate['name']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  affiliate['phone']!,
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  affiliate['location']!,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.download, color: adth),
                          SizedBox(width: 16),
                          Icon(Icons.more_horiz, color: adth),
                        ],
                      ),
                    ),
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

class AddAffiliateDialog extends StatelessWidget {
  const AddAffiliateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 3),
      insetAnimationCurve: Curves.easeInBack,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    "Add Affiliate",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Full Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Mobile Number",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Email Address",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Address",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                // width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      borderOnForeground: false,
                      child: Container(
                        width: 115,
                        height: 40,
                        // height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: adth),
                          // borderRadius: BorderRadiusGeometry.circular(12),
                          color: bg,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          // padding: EdgeInsets.all(0),
                          // color: Colors.white,
                          onTap: () {
                            // shareImageAndText();
                          },
                          child: Center(
                            child: Text(
                              'Discard Changes',
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 40,

                        width: 108,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        // width: double.infinity,
                        child: ClipRRect(
                          child: GestureDetector(
                            onTap: () {
                              // copyText("https://bounten.com/lakshit");
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                'Create Affiliate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
