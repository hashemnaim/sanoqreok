import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/appLocale/appLocale.dart';
import 'package:sanoqreok/auth/Login.dart';
import 'package:sanoqreok/auth/Register.dart';
import 'design/customeColor.dart';
import 'package:get/get.dart';
import 'myApp/homePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

customeColor_ c = new customeColor_();

bool? islogin;

// Future background(RemoteMessage message) async {
//   print("${message.notification?.body}");
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialization(null);
  // FirebaseMessaging.onBackgroundMessage(background);
  // var user = FirebaseAuth.instance.currentUser;
  // if (user == null) {
  //   islogin = false;
  // } else {
  //   islogin = true;
  // }
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(milliseconds: 60));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar", ""), Locale("en", "")],
        localeResolutionCallback: (currentLang,supportLang){
          if(currentLang !=null){
            for(Locale locale in supportLang){
              if(locale.languageCode == currentLang.languageCode){return currentLang;}
            }
         return supportLang.first; }
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          buttonColor: c.mycolor,
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.accent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          fontFamily: "22326-alarabiyafont",
          textTheme: TextTheme(
              headline2: TextStyle(
                  color: c.mycolor,
                  fontSize: 25,
                  fontFamily: "22326-alarabiyafont")),
          primarySwatch: c.mycolor,
        ),
        routes: {
          "login": (context) => Login(),
          "Register": (context) => Register(),
          "homePage": (context) => homePage(),
        },
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: const Login(),
        ));
  }
}




/*  var response = await bookref.where(
        "categoryName", isEqualTo: "EnglishBooksID").get();
    response.docs.forEach((element) {
      books.add(element.data());
    });*/