import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  int staffn = 7;
  int cp = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
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
      drawer: AppDrawer(page: 5),
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
                      "Staff Members",
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
                            builder: (context) => AddStaffDialog(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 18, color: adth),
                            Text("Add Staff", style: TextStyle(color: adth)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: staffn,
                itemBuilder: (context, index) {
                  return StaffCard(
                    "Aurelia Nightshade",
                    "+1 (555) 123-4567",
                    "Coppell, Virginia",
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

  Widget StaffCard(
    final String name,
    final String phone,
    final String location,
  ) {
    return Card(
      color: Colors.white,
      // elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                  Text(location),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: adth),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EditStaffDialog(),
                );
              },
              tooltip: "Edit",
            ),
            IconButton(
              icon: Icon(Icons.delete, color: adth),
              onPressed: () {
                staffn--;
                setState(() {});
              },
              tooltip: "Delete",
            ),
          ],
        ),
      ),
    );
  }
}

class AddStaffDialog extends StatelessWidget {
  const AddStaffDialog({super.key});

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
                    "Add Staff Members",
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

              const SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Permission"),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                ],
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
                                'Create Service',
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

class EditStaffDialog extends StatelessWidget {
  const EditStaffDialog({super.key});

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
                    "Edit Staff Members",
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

              const SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Permission"),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text("Permission 1"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                // width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      borderOnForeground: false,
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: adth),
                          // borderRadius: BorderRadiusGeometry.circular(12),
                          color: bg,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          // color: Colors.white,
                          onPressed: () {
                            // shareImageAndText();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, color: adth),
                              SizedBox(width: 10),
                              Text(
                                'Edit Changes',
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
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
            ],
          ),
        ),
      ),
    );
  }
}
