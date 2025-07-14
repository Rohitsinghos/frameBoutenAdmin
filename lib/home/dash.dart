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

class BountenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bounten Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}

void copyText(String text) {
  Clipboard.setData(ClipboardData(text: text));
  print("✅ Text copied: $text");
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        // Show the confirmation dialog
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App', style: TextStyle(color: adth)),
            content: Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        );
        // If the user confirmed, exit the app
        return shouldExit ?? false;
      },
      child: Scaffold(
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: Container(
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: MaterialButton(
                      color: adth,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddLeadDialog(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Add Lead',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

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
            ),

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
                      "Leads Quality Analysis",
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int index = 0; index < 4; index++)
                                      GestureDetector(
                                        onTap: () {
                                          tabb = index;
                                          setState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(8),

                                          child: Container(
                                            color: (index == tabb)
                                                ? adth
                                                : const Color.fromARGB(
                                                    255,
                                                    238,
                                                    248,
                                                    252,
                                                  ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Center(
                                                child: Text(
                                                  tabst[index],
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: (index != tabb)
                                                        ? adth
                                                        : Colors.white,
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
                            ),
                          ),

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      'Lead Quality Analysis',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...leads.map((lead) {
                                return TableRow(
                                  children: [
                                    Container(
                                      height: 50,
                                      color: Colors.white,
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                        child: Text(
                                          // overflow: TextOverflow.ellipsis,
                                          // maxLines: 3,
                                          textAlign: TextAlign.center,
                                          lead['name']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        // overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        lead['product']!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        // horizontal: 3,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(6),
                                        child: Container(
                                          color: const Color.fromARGB(
                                            255,
                                            238,
                                            248,
                                            252,
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              // padding: EdgeInsets.symmetric(
                                              //   horizontal: 5,
                                              // ),
                                              alignment: Alignment.center,

                                              value: selectedValue,
                                              icon: Icon(Icons.arrow_drop_down),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                              ),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedValue = newValue!;
                                                });
                                              },
                                              items:
                                                  <String>[
                                                    'High Quality',
                                                    'Low Quality',
                                                    'Poor Quality',
                                                    'Poori Quality',
                                                    // 'Mango',
                                                  ].map<
                                                    DropdownMenuItem<String>
                                                  >((String value) {
                                                    return DropdownMenuItem<
                                                      String
                                                    >(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),

                                              // DropdownButton(
                                              //   dropdownColor: const Color.fromARGB(
                                              //     255,
                                              //     238,
                                              //     248,
                                              //     252,
                                              //   ),
                                              //   iconEnabledColor: const Color.fromARGB(
                                              //     255,
                                              //     238,
                                              //     248,
                                              //     252,
                                              //   ),
                                              //   onChanged: (value) {
                                              //     // butt = value.toString();
                                              //   },
                                              //   // value: lead,
                                              //   items: [],
                                              // child: Container(
                                              //   color: const Color.fromARGB(
                                              //     255,
                                              //     238,
                                              //     248,
                                              //     252,
                                              //   ),
                                              //   padding: EdgeInsets.all(4),
                                              //   child: Row(
                                              //     children: [
                                              //       Text(
                                              //         // overflow: TextOverflow.ellipsis,
                                              //         textAlign: TextAlign.center,
                                              //         '${lead['quality']} Quality',
                                              //         style: TextStyle(
                                              //           fontSize: 11,
                                              //           color: Colors.black,
                                              //         ),
                                              //       ),
                                              //       Icon(Icons.arrow_drop_down),
                                              //     ],
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
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
                      fontSize: 19,
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
                style: TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddLeadDialog extends StatelessWidget {
  const AddLeadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 3),
      insetAnimationCurve: Curves.easeInBack,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
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

// class _DashboardScreenState extends State<DashboardScreen> {
//   List tabst = ['All leads', 'Poor Quality', 'Low Quality', 'High Quality'];

//   String selectedValue = 'Poor Quality';

//   int tabb = 0;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Show the confirmation dialog
//         final shouldExit = await showDialog<bool>(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Exit App', style: TextStyle(color: adth)),
//             content: Text('Do you want to exit the app?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: Text('Yes'),
//               ),
//             ],
//           ),
//         );
//         // If the user confirmed, exit the app
//         return shouldExit ?? false;
//       },
//       child: Scaffold(
//         drawer: AppDrawer(page: 1),
//         appBar: AppBar(
//           surfaceTintColor: Colors.white,
//           title: Image.asset('assets/logo2.jpg', height: 40),
//           backgroundColor: Colors.white,
//           // leading: Builder(
//           //   builder: (context) => IconButton(
//           //     icon: Icon(Icons.menu),
//           //     onPressed: () => Scaffold.of(context).openDrawer(),
//           //   ),
//           // ),
//           actions: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: const Color.from(
//                     alpha: 1,
//                     red: 0.416,
//                     green: 0.624,
//                     blue: 0.988,
//                   ),
//                   width: 3,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),

//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/avatar.png'),
//                 radius: 15,
//               ),
//             ),
//             SizedBox(width: 10),
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Stats Cards
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 childAspectRatio: 2,
//                 children: [
//                   dashboardCard("15,678", "Total Traffic", Icons.traffic),
//                   dashboardCard("15,678", "Total Leads", Icons.leaderboard),
//                   dashboardCard("56", "Total Affiliates", Icons.group),
//                   dashboardCard("₹12,345", "Total Payout", Icons.attach_money),
//                 ],
//               ),
//               SizedBox(height: 20),

//               // Add Lead Button
//               ElevatedButton.icon(
//                 onPressed: () {},

//                 icon: Icon(Icons.add, color: Colors.white),
//                 label: Text("Add Lead", style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 30),
//                   backgroundColor: adth,
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 ),
//               ),

//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 40,
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         for (int index = 0; index < 4; index++)
//                           GestureDetector(
//                             onTap: () {
//                               tabb = index;
//                               setState(() {});
//                             },
//                             child: ClipRRect(
//                               borderRadius: BorderRadiusGeometry.circular(8),

//                               child: Container(
//                                 color: (index == tabb)
//                                     ? adth
//                                     : const Color.fromARGB(255, 238, 248, 252),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       tabst[index],
//                                       style: TextStyle(
//                                         fontSize: 10,
//                                         color: (index != tabb)
//                                             ? adth
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Tabs
//               // TabBar(
//               //   labelColor: adth,
//               //   unselectedLabelColor: Colors.black,
//               //   indicatorColor: adth,
//               //   tabs: [
//               //     Tab(text: "All leads"),
//               //     Tab(text: "Poor Quality"),
//               //     Tab(text: "Low Quality"),
//               //     Tab(text: "High Quality"),
//               //   ],
//               // ),
//               SizedBox(height: 12),

//               // Data Table
//               Container(
//                 child: DataTable(
//                   columnSpacing: 2,
//                   columns: const [
//                     DataColumn(label: Text("Name")),
//                     DataColumn(label: Text("Product")),
//                     DataColumn(label: Text("Lead \nQuality")),
//                   ],
//                   rows: List.generate(
//                     10,
//                     (index) => DataRow(
//                       cells: [
//                         DataCell(Text("Samuel Peterson")),
//                         DataCell(Text("Gadget Pro 2023")),
//                         DataCell(
//                           Text(
//                             index == 1
//                                 ? "High Quality"
//                                 : index == 2
//                                 ? "Low Quality"
//                                 : "Poor Quality",
//                             style: TextStyle(color: adth),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget dashboardCard(String title, String subtitle, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             Icon(icon, size: 30, color: adth),
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
// import 'package:bountenadmin/compo/drawer.dart';
//
// import 'package:bountenadmin/model/appdata.dart';
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
//       theme: ThemeData(primarySwatch: adth),
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
//                 backgroundColor: adth,
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//             ),

//             SizedBox(height: 20),

//             // Tabs
//             // TabBar(
//             //   labelColor: adth,
//             //   unselectedLabelColor: Colors.black,
//             //   indicatorColor: adth,
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
//                           style: TextStyle(color: adth),
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
//             Icon(icon, size: 30, color: adth),
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
//               color: bg,
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
//                   style: TextStyle(color: adth),
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
//                 title: Text("Services", style: TextStyle(color: adth)),
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
//                   style: TextStyle(color: adth),
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
//                 title: Text("PDF", style: TextStyle(color: adth)),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FAQPage()),
//                   );
//                 },
//               ),

//               ListTile(
//                 contentPadding: EdgeInsets.only(left: 72),
//                 title: Text("FAQ's", style: TextStyle(color: adth)),
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
