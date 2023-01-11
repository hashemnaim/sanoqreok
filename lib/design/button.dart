import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/auth/Login.dart';
import 'package:sanoqreok/design/customeColor.dart';
import 'package:sanoqreok/myApp/homePage.dart';

customeColor_ c = customeColor_();


class mybutton {



  AnimatedButton loginButton = AnimatedButton(
  color: c.mycolor,
  text: 'تسجيل الدخول',
  buttonTextStyle: TextStyle(fontSize: 20),
  height: 40,
  pressEvent: () {
    Get.offAll(homePage());

  },
  );  AnimatedButton registerButton = AnimatedButton(
  color: c.mycolor,
  text: 'التسجيل',
  buttonTextStyle: TextStyle(fontSize: 20),
  height: 40,
  pressEvent: () {
    Get.offAll(homePage());

  },
  );

 AnimatedButton drawerButton = AnimatedButton(
  color: c.mycolor,
  text: 'تسجيل الخروج',
  buttonTextStyle: TextStyle(fontSize: 20),
  height: 30,width: 250,
  pressEvent: () {
    Get.offAll(Login());
  },
  );

}
