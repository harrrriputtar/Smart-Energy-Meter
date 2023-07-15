import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class addingDeviceScreen extends StatelessWidget {
  List<String> itemName = [
    'Air Condition',
    'Television',
    'Refrigarator',
    'Fan',
    'Lights',
    'Microwave',
    'Other'
  ];
  final name = TextEditingController();
  final wattCnt = TextEditingController();

  List<String> icons = [
    "assets/AC.svg",
    "assets/TV.svg",
    "assets/Referigator.svg",
    "assets/Fan.svg",
    "assets/Light.svg",
    "assets/Microwave.svg",
    "assets/Other.svg"
  ];

  List<String> deviceNameList = ['Fan1', 'Fan2', 'Fan3', 'Fan4'];

  List<double> deviceValueList = [60, 60, 60, 60];

  addNew() async {
    await FirebaseFirestore.instance.collection("user").doc("user1").update({
      "Device_Watt": {
        name.text: wattCnt.text,
      }
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                        child: Text(
                          'Add Device',
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 200,
                          width: 350,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                        child: Text(
                          'Device Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11, top: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'DEVICE NAME',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 35,
                                  width: 150,
                                  child: TextField(
                                    controller: name,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      labelText: 'Enter device name',
                                      labelStyle: TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(8),
                                      // fillColor: Color.fromARGB(255, 185, 184, 184),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 75,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'WATTAGE',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  child: TextField(
                                    controller: wattCnt,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      labelText: 'Watts',
                                      labelStyle: TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(8),
                                      // fillColor: Color.fromARGB(255, 185, 184, 184),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '      ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    addNew();
                                  },
                                  child: Container(
                                    alignment: AlignmentDirectional.center,
                                    height: 35,
                                    width: 50,
                                    child: Text('Add'),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 107, 185, 249),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                        child: Text(
                          'Added device List',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
                                'DEVICE LIST',
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
                                'WATTAGE',
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
                      ),
                      DeviceList(),
                    ]),
              ),
            )));
  }
}

class DeviceList extends StatelessWidget {
  const DeviceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 320,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            final color = index % 2 == 0
                ? Colors.white
                : Color.fromARGB(255, 227, 224, 224);
            return CustomDeviceTile(
              color: color,
              itemName: "Fan1",
              itemValue: 100,
            );
          }),
    );
  }
}

class CustomDeviceTile extends StatelessWidget {
  Color color;
  String itemName;
  int itemValue;
  CustomDeviceTile(
      {super.key,
      required this.color,
      required this.itemName,
      required this.itemValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 3),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(3), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'HelveticaNeueLTComRoman',
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            itemValue.toString(),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'HelveticaNeueLTComRoman',
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
