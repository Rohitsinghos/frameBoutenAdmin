// import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class LeadManagementPage extends StatefulWidget {
  const LeadManagementPage({super.key});

  @override
  State<LeadManagementPage> createState() => _LeadManagementPageState();
}

class _LeadManagementPageState extends State<LeadManagementPage> {
  int cp = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 3),
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
                      "Lead Management",
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
                            builder: (context) => AddLeadManDialog(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 18, color: adth),
                            Text("Add Lead", style: TextStyle(color: adth)),
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
                  labelText: 'Search Lead...',
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

            // const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
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
    String le = leadQuality;
    final statusColor = status == "Approved" ? Colors.green : Colors.red;
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(phone, style: TextStyle(fontSize: 11)),
                  Text(location, style: TextStyle(fontSize: 11)),
                  const SizedBox(height: 8),

                  Text(
                    "Product",
                    style: TextStyle(
                      color: blacki,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  Text(
                    product,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),

                  // const SizedBox(height: 8),
                ],
              ),
            ),
            Container(
              // width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Lead Quality Check",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: adth.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                le,
                                style: TextStyle(
                                  color: adth,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: adth),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                status,
                                style: TextStyle(
                                  color: statusColor,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: statusColor),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddLeadManDialog extends StatelessWidget {
  const AddLeadManDialog({super.key});

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
                    "Add Lead",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Product Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Product Name",
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
                    "Price",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Price",
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
                    "Commision",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Commision",
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
                    "Quantity",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Quantity",
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add video by language",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15,
                      ),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          LanguageUploadTile(label: "Hindi"),
                          LanguageUploadTile(label: "English"),
                          LanguageUploadTile(label: "Marathi"),
                          LanguageUploadTile(label: "Gujrati"),
                        ],
                      ),
                    ),
                  ],
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
                                'Create Lead',
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

class LanguageUploadTile extends StatelessWidget {
  final String label;

  const LanguageUploadTile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade50,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.image_outlined, size: 22, color: Colors.blue),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
