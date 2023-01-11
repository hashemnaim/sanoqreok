import 'package:flutter/material.dart';

import '../design/appBar.dart';

class bookDetails extends StatefulWidget {
  const bookDetails({Key? key}) : super(key: key);

  @override
  State<bookDetails> createState() => _bookDetailsState();
}

class _bookDetailsState extends State<bookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: myappBar("تفاصيل الكتاب"),);
  }
}
