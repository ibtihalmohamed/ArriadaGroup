// import 'package:arriada_group01/widgets/icon_btn_counter_widget.dart';
import 'package:flutter/material.dart';

import '../../screens/sub_screens/cart_screen.dart';
import '../../screens/sub_sub_screens/notification_screen.dart';
import 'icon_btn_counter_widget.dart';
import 'search_field_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/shoppingcart.png",
              //غيري الايقونات هنا
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen()));
              }), //navigate to cart screen
          IconBtnWithCounter(
              svgSrc: "assets/bell.png",
              numOfitem: 3,
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NotificationScreen()));
              }),
        ],
      ),
    );
  }
}
