import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/auth/Login.dart';
import 'package:sanoqreok/controller/controller.dart';
import 'package:sanoqreok/design/button.dart';
import 'package:sanoqreok/design/inkwell.dart';
import 'package:sanoqreok/design/textformfield.dart';
import '../design/customeColor.dart';
import 'package:get/get.dart';
import 'package:animated_button/animated_button.dart' as Button;
import '../component/alertLoding.dart';
import '../design/text.dart';

customeColor_ c = new customeColor_();
textStyle ts = textStyle();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formstat = new GlobalKey<FormState>();
  controller control = controller();

  signUp_method() async {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        await Firebase.initializeApp();
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: control.email,
          password: control.password,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          print('The password provided is too weak.');
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text("The password provided is too weak"))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();

          print('The account already exists for that email.');
          AwesomeDialog(
              context: context,
              title: "error",
              body: Text("The account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
      print("valid");
    } else {
      Navigator.of(context).pop();

      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formstat,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "انضم إلى سَنُقْرِئُكَ",
                  style: ts.textstyle3,
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      mytextformfield().nameFiled,
                      mytextformfield().userField,
                      mytextformfield().passField,
                      SizedBox(
                        height: 60,
                      ),
                      mybutton().registerButton,
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           myinkewell().myinkweregister,
                            myinkewell().inkwellTextregister
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
