import 'package:bountenadmin/compo/drawer.dart';
import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_plus/share_plus.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart'
// show rootBundle; // Required for Clipboard

// void main() {
// runApp(BountenApp());
// }

class MemberPerformance extends StatefulWidget {
  const MemberPerformance({super.key});

  @override
  State<MemberPerformance> createState() => _MemberPerformanceState();
}

class _MemberPerformanceState extends State<MemberPerformance> {
  final List<Map<String, String>> leads = List.generate(
    10,
    (index) => {
      'name': 'Samuel Peterson',
      'product': 'Gadget Pro 2023',
      'quality': [
        'Poor',
        'High',
        'Low',
        'Poor',
        'Poor',
        'Poor',
        'Poor',
        'High',
        'Low',
        'Poor',
      ][index],
    },
  );

  // Future<void> _shareImageAndText() async {
  //   // 1. Load image from assets or network (here: from assets)
  //   // final byteData = await rootBundle.load('assets/logo.jpg');

  //   // // 2. Save it to a temporary file
  //   // final tempDir = await getTemporaryDirectory();
  //   // final file = File('${tempDir.path}/shared_image.jpg');
  //   // await file.writeAsBytes(byteData.buffer.asUint8List());

  //   // 3. Share the image and text
  //   await Share.share('Check out this image!');
  // }

  // final _pickImage = null;

  // void _uploadPickedImage() async {
  //   final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (picked != null) {
  //     File imageFile = File(picked.path);
  //     // _pickedImage = File(picked.path);
  //   }
  // }

  // Future<void> _showPickOptionsDialog() async {
  //   final isCamera = await showDialog<bool>(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text('Select image source'),
  //       actions: [
  //         TextButton(
  //           child: const Text('Camera'),
  //           onPressed: () => Navigator.pop(context, true),
  //         ),
  //         TextButton(
  //           child: const Text('Gallery'),
  //           onPressed: () => Navigator.pop(context, false),
  //         ),
  //       ],
  //     ),
  //   );
  //   if (isCamera == null) return;
  //   _pickImage(isCamera ? ImageSource.camera : ImageSource.gallery);
  // }

  List tabst = ['All leads', 'Poor Quality', 'Low Quality', 'High Quality'];

  String selectedValue = 'Poor Quality';

  int tabb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bg,
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
      drawer: AppDrawer(page: 1),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
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
                    "Members Performance and Payout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: blacki,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),

          Wrap(
            alignment: WrapAlignment.center,
            children: [
              _buildStatCard("Total Traffic", "15,678", Icons.traffic),
              _buildStatCard("Total Leads", "15,678", Icons.group),
              _buildStatCard(
                "Total Earnings",
                "₹12,345",
                Icons.account_balance_wallet,
              ),
              _buildStatCard("Pending Leads", "56", Icons.pending),
            ],
          ),
          SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             // color: Colors.white,

          //             // borderRadius: BorderRadius.circular(15),
          //             // border: Border.all(color: adth),
          //           ),
          //           child: TextField(
          //             readOnly: true,
          //             decoration: InputDecoration(
          //               hintText: 'https://bounten.com/lakshit',
          //               suffixIcon: IconButton(
          //                 icon: Icon(Icons.qr_code, color: adth),
          //                 onPressed: () {
          //                   copyText("https://bounten.com/lakshit");
          //                 },
          //               ),
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(12),

          //                 borderSide: BorderSide(color: adth),
          //               ),
          //               hintStyle: TextStyle(color: adth),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 15),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: Card(
          //     child: Container(
          //       width: 160,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(12),
          //         child: MaterialButton(
          //           color: adth,
          //           onPressed: () {
          //             // copyText("https://bounten.com/lakshit");
          //           },
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Icon(Icons.add, color: Colors.white),
          //               Padding(
          //                 padding: const EdgeInsets.all(15.0),
          //                 child: Text(
          //                   'Add Lead',
          //                   style: TextStyle(color: Colors.white),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),

          //  ElevatedButton.icon(
          //   onPressed: () {},

          //   icon: Icon(Icons.add, color: Colors.white),
          //   label: Text("Add Lead", style: TextStyle(color: Colors.white)),
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size(double.infinity, 30),
          //     backgroundColor: adth,
          //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          //   ),
          // ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Card(
          //         child: Container(
          //           width: 160,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(12),
          //             child: MaterialButton(
          //               color: adth,
          //               onPressed: () {
          //                 copyText("https://bounten.com/lakshit");
          //               },
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.copy, color: Colors.white),
          //                   Padding(
          //                     padding: const EdgeInsets.all(15.0),
          //                     child: Text(
          //                       'Copy Link',
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Card(
          //         borderOnForeground: false,
          //         child: Container(
          //           width: 160,

          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             border: Border.all(color: adth),
          //           ),
          //           child: ClipRRect(
          //             borderRadius: BorderRadiusGeometry.circular(12),
          //             child: MaterialButton(
          //               color: Colors.white,
          //               onPressed: () {
          //                 _shareImageAndText();
          //               },
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Icon(Icons.share_outlined, color: adth),
          //                   Padding(
          //                     padding: const EdgeInsets.all(15.0),
          //                     child: Text(
          //                       'Share',
          //                       style: TextStyle(color: adth),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Affiliates",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),
                  ),
                ),

                Container(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                          ),
                          // defaultColumnWidth: ,
                          columnWidths: const {
                            0: FixedColumnWidth(110),
                            1: FixedColumnWidth(100),
                            2: FixedColumnWidth(100),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,

                          children: [
                            TableRow(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Product',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Commision',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData Ico) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Container(
          width: 160,
          height: 90,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      color: adth,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 252),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    padding: EdgeInsets.all(3),
                    child: Icon(Ico, color: adth, size: 22),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(fontSize: 11, color: blacki),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
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
    // String le = leadQuality;
    // final statusColor = status == "Approved" ? Colors.green : Colors.red;
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Column(
                  children: [
                    Text(phone, style: TextStyle(fontSize: 11)),
                    Text(location, style: TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  "Product : ",
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
              ],
            ),

            Text("Commision"),
            Text("\$100"),

            // const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
