import 'package:arriada_group01/screens/main_screens/detailes_screen.dart';
import 'package:flutter/material.dart';

import 'section_title_widget.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/sales1.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DetailsScreen()));
                },
              ),
              SpecialOfferCard(
                image: "assets/sales2.png",
                category: "Computers",
                numOfBrands: 24,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DetailsScreen()));
                },
              ),
              SpecialOfferCard(
                image: "assets/sales3.png",
                category: "Computers",
                numOfBrands: 24,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DetailsScreen()));
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
