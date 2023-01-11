import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sanoqreok/design/customeColor.dart';
import 'package:sanoqreok/myApp/homePage.dart';

import '../design/appBar.dart';

class bookCategory extends StatefulWidget {
  final String categoryID;
  const bookCategory({Key? key, required this.categoryID}) : super(key: key);

  @override
  State<bookCategory> createState() => _bookCategoryState();
}

CollectionReference bookref = FirebaseFirestore.instance.collection("books");

customeColor_ c = customeColor_();

class _bookCategoryState extends State<bookCategory> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myappBar("تصنيف فئة الكتب"),
        body: FutureBuilder(
            future: bookref.get(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot<Object?>> list = snapshot.data!.docs
                    .where((element) =>
                        element['categoryName'] == widget.categoryID)
                    .toList();
                return ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),

                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          // await noteref.doc(snapshot.data?.docs[i].id).delete();
                          // await FirebaseStorage.instance
                          //     .refFromURL(snapshot.data?.docs[i]['image'])
                          //     .delete();
                          // print("==========");
                          // print("delete success");
                        },
                        child: Listbooks(list[index]),
                        // child: ListNotes(
                        //   notes: snapshot.data?.docs[i],
                        //   editDoc: snapshot.data?.docs[i].id,
                        //   //  mediaquery:mediaquery
                        // )
                      );
                    });
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(
                  // child: CircularProgressIndicator(),
                  );
            }
            // itemCount: snapshot.data?.docs.length,
            ),
      ),
    );
  }
}

Widget Listbooks(QueryDocumentSnapshot<Object?> listbooks) {
  return InkWell(
    onTap: () {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //   return viewNote(
      //     notes: notes,
      //   );
      // }));
    },
    child: Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child:
                  //  Image.asset("assets/books.png"),
                  // child:
                  Image.network(
                "${listbooks['image']}",
                fit: BoxFit.fill,
                height: 150,
                width: 200,
              )),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(listbooks["bookName"]),
                  subtitle: Text(listbooks["authorName"]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: RatingBar.builder(
                    initialRating: double.parse(listbooks["rate"].toString()),
                    direction: Axis.horizontal,
                    tapOnlyMode: true,
                    ignoreGestures: true,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
