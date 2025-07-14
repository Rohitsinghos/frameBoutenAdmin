import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class ServiceNameScreen extends StatefulWidget {
  const ServiceNameScreen({super.key});

  @override
  State<ServiceNameScreen> createState() => _ServiceNameScreenState();
}

class _ServiceNameScreenState extends State<ServiceNameScreen> {
  final List<Map<String, dynamic>> VideoTitles = [
    {"name": "Unlocking t...", "videos": 12},
    {"name": "Data: A Co...", "videos": 12},
    {"name": "Maximizing...", "videos": 12},
    {"name": "Understandin...", "videos": 12},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 11),

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
        child: Padding(
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
                        "Service Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: blacki,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(color: adth),
                          color: adth,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        height: 50,
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          // onHighlightChanged: false,
                          // highlightColor: Colors.white,
                          // p
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => const AddVideoDialog(),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add, size: 18, color: Colors.white),
                              Text(
                                "Add Video",
                                style: TextStyle(color: Colors.white),
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Video Title",
                            style: TextStyle(
                              fontSize: 14,
                              color: blacki,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: blacki),
                        ],
                      ),
                    ),

                    // Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: VideoTitles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // width: 250,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 68,
                                          color: Colors.grey[300],
                                          margin: EdgeInsets.all(5),
                                        ),
                                        Container(
                                          width: 60,
                                          child: Text(
                                            VideoTitles[index]['name'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: bg,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${VideoTitles[index]["videos"]}",
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        // padding: EdgeInsets.all(0),
                                        child: Icon(Icons.edit, color: adth),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) =>
                                                const AddVideoDialog(),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        // padding: EdgeInsets.all(0),
                                        child: Icon(Icons.delete, color: adth),
                                        onTap: () {
                                          VideoTitles.removeAt(index);
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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

class AddVideoDialog extends StatelessWidget {
  const AddVideoDialog({super.key});

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
                    "Add Video",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "Video Title",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  labelText: "Video title",
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
                    "Video Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Video Description",
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
