import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class switchingstatusScreen extends StatefulWidget {
  @override
  State<switchingstatusScreen> createState() => _switchingstatusScreenState();
}

class _switchingstatusScreenState extends State<switchingstatusScreen> {
  List<String> itemName = [
    'Air Condition',
    'Television',
    'Refrigarator',
    'Fan',
  ];

  List<String> icons = [
    "assets/AC.svg",
    "assets/TV.svg",
    "assets/Referigator.svg",
    "assets/Fan.svg",
  ];

  List<Color> clr = [
    Color.fromARGB(255, 174, 255, 177),
    Color.fromARGB(255, 240, 158, 255)
  ];

  double numFans = 4;

  double numFridge = 1;

  double numLights = 2;

  double numTV = 1;

  double numAC = 1;

  @override
  initState() {
    getData();
    super.initState();
  }

  List<String> activeDevice = [];

  List<String> deviceNameList = ['Fan1', 'Fan2', 'Fan3', 'Fan4'];

  List<double> deviceValueList = [60, 60, 60, 60];

  Map<String, dynamic> item_bill = {};

  Map<String, dynamic> On_dict = {};

  String total_bill = "0";

  Map<String, dynamic> total_dict = {};

  String total_energy = "0";

  String total_on_device = "0";
  int total_fan = 0;
  int total_LED = 0;
  int total_TV = 0;
  int total_Refrigerator = 0;
  getData() async {
    DocumentSnapshot value =
        await FirebaseFirestore.instance.collection("user").doc("user1").get();
    final value1 = (value.data() as dynamic);
    final val2 = value1["Total_Dict"] as Map?;
    Map<String, dynamic> fan = value1["On_dict"];
    // final t2 = value1["Total_Energy"].toString();
    print(fan["Fan"].toString());
    setState(() {
      On_dict = fan;
      total_fan = fan["Fan"];
      total_LED = fan["LED"];
      total_TV = fan["TV"];
      total_Refrigerator = fan["Fan"];

      // total_energy = t2;
      // item_bill = value1["Itemized_Bill"].toStringAsFixed(2);
      // total_bill = value1["Total_Bill"].toString();
      // On_dict = value1["On_dict"];
      // total_energy = value1["Total_Energy"].toStringAsFixed(2);
      // total_dict = value1["Total_Dict"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 195, 238),
        leading: IconButton(
          onPressed: () {
            Get.to(homeScreen());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Voltwise',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: 160,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 152, 251, 155),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('FANS'),
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index < total_fan
                                          ? SvgPicture.asset(
                                              'assets/Fan.svg',
                                              height: 20,
                                              width: 20,
                                              color: Colors.black,
                                            )
                                          : SvgPicture.asset(
                                              'assets/Fan.svg',
                                              height: 20,
                                              width: 20,
                                              color: Colors.white,
                                            )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 80,
                        width: 160,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 243, 203, 250),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('REFERIGATOR'),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.all(10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        index < total_Refrigerator
                                            ? SvgPicture.asset(
                                                'assets/Referigator.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.black,
                                              )
                                            : SvgPicture.asset(
                                                'assets/Referigator.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.white,
                                              )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 80,
                        width: 160,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 149, 152, 251),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('AC'),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.all(10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        index < numAC
                                            ? SvgPicture.asset(
                                                'assets/AC.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.black,
                                              )
                                            : SvgPicture.asset(
                                                'assets/AC.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.white,
                                              )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 160,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 241, 188, 252),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('TV'),
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index < total_TV
                                          ? SvgPicture.asset(
                                              'assets/TV.svg',
                                              height: 20,
                                              width: 20,
                                              color: Colors.black,
                                            )
                                          : SvgPicture.asset(
                                              'assets/TV.svg',
                                              height: 20,
                                              width: 20,
                                              color: Colors.white,
                                            )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 130,
                        width: 160,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 245, 106, 106),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('LIGHTS'),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.all(10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        index < total_LED
                                            ? SvgPicture.asset(
                                                'assets/Light.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.black,
                                              )
                                            : SvgPicture.asset(
                                                'assets/Light.svg',
                                                height: 20,
                                                width: 20,
                                                color: Colors.white,
                                              )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
