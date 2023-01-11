import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/text.dart';
import 'package:get/get.dart';
import '../myApp/books_categoty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

textStyle ts = textStyle();

class mylistview extends StatefulWidget {
  final books;

  const mylistview({Key? key, this.books}) : super(key: key);

  @override
  State<mylistview> createState() => _mylistviewState();
}

class _mylistviewState extends State<mylistview> {
  List books = [];

  CollectionReference categoryref =
      FirebaseFirestore.instance.collection("category");

  getData() async {}

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoryref.get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return SizedBox(
                  height: 70,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => bookCategory(
                            categoryID: snapshot.data!.docs[i]["ID"],
                          ));
                    },
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.left_chevron,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "المزيد",
                                  style: ts.textstyle2,
                                ),
                                const Spacer(),
                                Text(
                                  "${snapshot.data!.docs[i]["categoryName"]}",
                                  style: ts.textstyle2.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            // Container(
                            //     height: 100,
                            //     width: 80,
                            //     child: FutureBuilder(
                            //       future: bookref.get(),
                            //       builder: (BuildContext context,
                            //           AsyncSnapshot<dynamic> snapshot) {
                            //         if (snapshot.hasData) {
                            //           var response = bookref.get();
                            //           //هنا الكود الناقص تبع الكتب حسب الفئة
                            //         }
                            //         return const Center();
                            //       },
                            //     ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
              // child: CircularProgressIndicator(),
              );
        });
  }
}
//

// ListView(
// shrinkWrap: true,
// children: <Widget>[
// Row(
// children: [
// // Expanded(
// //   child:
// Icon(
// CupertinoIcons.left_chevron,
// size: 15,
// color: Colors.grey,
// ),
// // ),
// InkWell(
// onTap: () {
// Get.to(bookCategory());
// },
// child: Text(
// "المزيد",
// style: ts.textstyle2,
// ),
// ),
// Spacer(),
// Text(
// "روايات",
// style: ts.textstyle2,
// )
// ],
// ),
// Container(
// height: 100,
// width: 80,
// child:
// ListView.builder(
// shrinkWrap: true,
// itemCount: snapshot.data?.docs.length,
// scrollDirection: Axis.horizontal,
// reverse: true,
// itemBuilder: (context, index) {
// return Container(
// child: Image.network("${widget.books['image']}"),
// );
// }),
