import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanoqreok/design/appBar.dart';
import 'package:sanoqreok/design/customeColor.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  State<favorite> createState() => _favoriteState();
}

customeColor_ c = customeColor_();

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: simpleappBar("كتبي"),
        body: ListView.builder(
          itemBuilder: (context, i) {
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
              child: Listbooks(),
              // child: ListNotes(
              //   notes: snapshot.data?.docs[i],
              //   editDoc: snapshot.data?.docs[i].id,
              //   //  mediaquery:mediaquery
              // )
            );
          },
          // itemCount: snapshot.data?.docs.length,
        ),
      ),
    );
  }
}

class Listbooks extends StatelessWidget {
  final books;

  Listbooks({this.books});

  @override
  Widget build(BuildContext context) {
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
              flex: 3,
              child: Image.asset("assets/books.png"),
              // child:
              // Image.network(
              //   "${notes['image']}",
              //   fit: BoxFit.fill,
              //   height: 70,
              // )
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  ListTile(
                    title: Text("واذا الصحف نشرت"),
                    subtitle: Text("ادهم شرقاوي"),
                    trailing: IconButton(onPressed: () {
                      //delete book from favorite
                    }, icon: Icon(Icons.favorite, color:c.mycolor,),),
                    // title: Text("${notes['note title']}"),
                    // subtitle: Text("${notes['note']}"),
                  ),

                  Container(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(

                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          size: 16, color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 16, color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 16, color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 16, color: Colors.orangeAccent,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 16, color: Colors.orangeAccent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
