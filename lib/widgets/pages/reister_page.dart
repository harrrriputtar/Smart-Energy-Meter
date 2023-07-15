import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widgets/pages/home_screen.dart';

import 'adding_device_screen.dart';
import 'login_screen.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Text(
                'Please enter your e-mail address and create password',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  // fillColor: colorSearchBg,
                ),
                onSubmitted: (_) => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter e-mail id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  // fillColor: colorSearchBg,
                ),
                onSubmitted: (_) => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter the password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                  // fillColor: colorSearchBg,
                ),
                onSubmitted: (_) => {},
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Get.offAll(homeScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 86, 173, 244),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // Replace childWidget with your desired child widget
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Get.offAll(LoginScreen());
                  },
                  child: Text('Login'),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
