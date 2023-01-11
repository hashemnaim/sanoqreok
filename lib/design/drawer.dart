import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/button.dart';
import 'package:sanoqreok/design/text.dart';
import '../myApp/aboutUs.dart';
import '../myApp/contact_us.dart';


class mydrawer extends StatelessWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "سَنُقْرِئُكَ",
                  style:textStyle().drawertext
              ),
              Image.asset(
                "assets/girl.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child:
                Text("عن سَنُقْرِئُكَ", style: textStyle().drawertext),
                onTap: () {
                  Get.to(aboutUs());
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child:
                Text("اتصل بنا", style: textStyle().drawertext),
                onTap: () {
                  Get.to(contact_us());
                },
              ),
              SizedBox(
                height: 50,
              ),
              mybutton().drawerButton
            ],
          ),
        ),
      ),
    );
  }
}
