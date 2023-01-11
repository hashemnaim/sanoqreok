import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: Container(
          color: Colors.white12,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  decoration: InputDecoration(fillColor:Colors.grey ,
                      icon: Icon(Icons.search),
                      labelText: " ابحث عن اسم كتاب أو مؤلف"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
