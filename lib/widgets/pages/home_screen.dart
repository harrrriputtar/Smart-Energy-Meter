import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/pages/itemBill.dart';
import '/widgets/pages/switchingStatus_screen.dart';

import 'adding_device_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
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

  List<String> activeDevice = [];

  List<String> deviceNameList = ['Fan1', 'Fan2', 'Fan3', 'Fan4'];

  List<double> deviceValueList = [60, 60, 60, 60];

  String active = "0";

  @override
  void initState() {
    getData();
    super.initState();
  }

  Map<String, dynamic> item_bill = {};

  Map<String, dynamic> On_dict = {};

  String total_bill = "0";

  Map<String, dynamic> total_dict = {};

  String total_energy = "0";

  String total_on_device = "0";

  getData() async {
    DocumentSnapshot value =
        await FirebaseFirestore.instance.collection("user").doc("user1").get();
    final value1 = (value.data() as dynamic);
    final val2 = value1["Total_Dict"] as Map;
    var t1 = value1["Total_No_Devices_On"].toString();
    double t2 = value1["Total_Energy"];
    double t3 = value1["Total_Bill"];
    print(total_on_device.toString());
    setState(() {
      total_on_device = t1;
      total_energy = (t2.floor()).toString();
      total_bill = (t3.floor()).toString();
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
            Get.to(addingDeviceScreen());
          },
          icon: Icon(
            Icons.add,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                  child: Text(
                    'Hello Arjun',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(switchingstatusScreen());
                      },
                      child: Container(
                        height: 90,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 152, 251, 155)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Group_3.svg',
                                    height: 30,
                                    width: 30,
                                  ),
                                  Text(
                                    total_on_device,
                                    style: TextStyle(fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text('Active Devices'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 253, 173, 205)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/Group_6.svg',
                                  height: 30,
                                  width: 30,
                                ),
                                Text(
                                  '05%',
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text('Today\'s Savings'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 221, 172, 253)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/Group_2.svg',
                                  height: 30,
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      total_energy.substring(0, 1),
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      'kWh',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Units Consumed'),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(itemBillScreen());
                      },
                      child: Container(
                        height: 90,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 253, 173, 205)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/Group_1.svg',
                                    height: 30,
                                    width: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        total_bill,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text('Estimated Bill'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recently Switched on Devices',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(switchingstatusScreen());
                  },
                  child: Container(
                    height: 80,
                    width: 350,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.5,
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(switchingstatusScreen());
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 3)),
                                child: SvgPicture.asset(
                                  icons[index],
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                itemName[index],
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 08,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tips to save your consumption',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Watch out for these devices!',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'DEVICE NAME',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  'POWER CONSUMED',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
