import 'package:animated_button/animated_button.dart' as Button;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/auth/Register.dart';
import 'package:sanoqreok/controller/controller.dart';
import 'package:sanoqreok/design/button.dart';
import 'package:sanoqreok/design/inkwell.dart';
import 'package:sanoqreok/design/text.dart';
import 'package:sanoqreok/design/textformfield.dart';
import '../design/customeColor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

customeColor_ c = customeColor_();
textStyle ts = textStyle();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstat = new GlobalKey<FormState>();

  controller control = controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formstat,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 321,
              width: double.maxFinite,
              child: Center(
                child: Image.asset("assets/loginn.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("كن واحداَ من عائلتنا وشاركنا القراءة",
                      textStyle: ts.textstyle3,
                      speed: Duration(microseconds: 100000))
                ],
              ),
            ),
            Form(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  mytextformfield().userField,
                  mytextformfield().passField,
                  SizedBox(
                    height: 20,
                  ),
                 mybutton().loginButton,
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       myinkewell().myinkwelogin,
                       myinkewell().inkwellTextlogin
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
