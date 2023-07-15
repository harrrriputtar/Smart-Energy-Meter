import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '/widgets/pages/billing_details_screen.dart';
import '/widgets/pages/home_screen.dart';

class itemBillScreen extends StatelessWidget {
  const itemBillScreen({super.key});

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
        actions: [
          IconButton(
              onPressed: () {
                Get.to(billingScreen());
              },
              icon: Icon(
                Icons.currency_rupee,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Detailed Analysis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25),
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
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Text(
                    'AMOUNT(₹)',
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
          DeviceBillList()
        ],
      ),
    );
  }
}

class DeviceBillList extends StatelessWidget {
  const DeviceBillList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Container(
        height: 400,
        width: 350,
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              final color = index % 2 == 0
                  ? Colors.white
                  : Color.fromARGB(255, 192, 229, 250);
              return CustomItemBillTile(
                color: color,
                itemName: "Fan1",
                itemValue: 100,
              );
            }),
      ),
    );
  }
}

class CustomItemBillTile extends StatelessWidget {
  Color color;
  String itemName;
  int itemValue;
  CustomItemBillTile(
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
