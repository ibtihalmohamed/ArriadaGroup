// ignore_for_file: must_be_immutable

import 'package:arriada_group01/providers/dark_theme_provider.dart';
import 'package:arriada_group01/screens/sub_screens/detailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arriada_group01/helpers/constants.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getCategories() async {
    final categories1 = await firestore.collection("categories").get();

    for (var category in categories1.docs) {
      print(category.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    //ديري فولدر للايقونات وحطي الصور وغيريهم هنا
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/selectall.png",
        "text": "All"
      }, //ibtihal don't forget to localize the text here******
      {"icon": "assets/iphonee.png", "text": "Phones "},
      {"icon": "assets/games.png", "text": "Gaming"},
      {
        "icon": "assets/screen.png",
        "text": "LapTops",
      },
      {
        "icon": "assets/smartwatch.png",
        "text": "Watche",
      },
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => data()));
              // getCategories();
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, themeConsumer, child) {
      return GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 55,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: themeConsumer.isDark
                      ? Colors.white70
                      : mainColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(icon!),
              ),
              SizedBox(height: 5),
              Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: themeConsumer.isDark ? Colors.white : Colors.black),
              )
            ],
          ),
        ),
      );
    });
  }
}
