import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../design/appBar.dart';
import 'homePage.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar("عن التطبيق"),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/logo.png",
              width: 200,
            ),
            const Text(
              "الإصدار 1.0",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 100,
            ),
            Card(child: Image.asset("assets/aboutus.png"))
          ],
        ),
      ),
    );
  }
}
