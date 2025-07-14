// import 'package:bountenadmin/home/dash.dart';
import 'package:bountenadmin/compo/drawer.dart';

import 'package:bountenadmin/model/appdata.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Map<String, dynamic>> products = List.generate(5, (index) {
    return {'name': 'Gaming Mouse', 'price': 12000, 'quantity': 1000};
  });

  int cp = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      drawer: AppDrawer(page: 4),
      // backgroundColor: Colors.grey[100],
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
            // Header
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
                      "Products",
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
                            builder: (context) => AddProductsDialog(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 18, color: adth),
                            Text("Add Products", style: TextStyle(color: adth)),
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

            // Product List
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (_, __) => SizedBox(height: 5),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  EditProductsDialog(
                                                    // nm: product["name"],
                                                    // pr: product["price"],
                                                    // qa: product["quantity"],
                                                  ),
                                            );
                                          },
                                          icon: Icon(Icons.edit, color: adth),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            product.remove(index);
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.delete, color: adth),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "Quantity",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(product['price'].toString()),
                                    Spacer(),
                                    Text(product['quantity'].toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Actions
                        ],
                      ),
                    ),
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

class AddProductsDialog extends StatelessWidget {
  const AddProductsDialog({super.key});

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
                    "Add Products",
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
                                'Create Product',
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

class EditProductsDialog extends StatelessWidget {
  // final String nm;
  // final String pr;
  // final String qa;

  // const EditProductsDialog({
  //   required this.nm,
  //   required this.pr,
  //   required this.qa,
  // });

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
                    "Add Products",
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
                  labelText: "fhffhh",
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
                  labelText: "fhffhh",
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
                  labelText: "fhffhh",
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
                                'Create Product',
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
