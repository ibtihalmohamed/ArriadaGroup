import 'package:arriada_group01/helpers/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class data extends StatefulWidget {
  const data({super.key});

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List items = [];
  void getPopularProducts() async {
    //function to bring data from firestore
    var Products = await firestore.collection("Products").get();
    Products.docs.forEach((element) {
      items.add(element.data());
    });
    for (var item in Products.docs) {
      print(item.data());
    }
    setState(() {});
  }

  @override
  void initState() {
    getPopularProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          subtitle:
                              Text("description : ${items[i]["description"]}"),
                          title: Text("title : ${items[i]["title"]}"),
                        );
                        // Text("${items[i]}");
                      })
                  // Image.network("https://www.bing.com/images/search?view=detailV2&ccid=KUW7KLST&id=773312CE43097037DB2781E1CEFD87FE7288D793&thid=OIP.KUW7KLSThX0Xx3jiNpuVzwHaNK&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.2945bb28b493857d17c778e2369b95cf%3frik%3dk9eIcv6H%252fc7hgQ%26riu%3dhttp%253a%252f%252fimeinow.com%252fimg%252fiphone14better.png%26ehk%3duFTDXUApujYyCrotd2zAfgmbFPmsH8TL%252f8qvCyBFkKA%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=1889&expw=1063&q=iphone+14+png&simid=607987878635199451&FORM=IRPRST&ck=151C8C6B3BC6A0F451415E3618F1940C&selectedIndex=1&qpvt=iphone+14+png&ajaxhist=0&ajaxserp=0"),

                  );
            })),
      ),
    );
  }
}
