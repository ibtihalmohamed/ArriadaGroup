import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class CustomOrderNotifcation extends StatefulWidget {
  const CustomOrderNotifcation({Key? key}) : super(key: key);

  @override
  State<CustomOrderNotifcation> createState() => _CustomOrderNotifcationState();
}

class _CustomOrderNotifcationState extends State<CustomOrderNotifcation> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: const AssetImage("assets/Profile.png"),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Order Status",
              style: TextStyle(
                  fontSize: 16,
                  color: themeListener.isDark ? Colors.white : Colors.black)
              // Theme.of(context).textTheme.displaySmall!
              // .copyWith(color: mainColor)
              ,
            ),
            // const SizedBox(
            //   height: 0.1,
            //   width: 5,
            // ),
            Text(
              "our driver is on the way!",
              style: TextStyle(
                  fontSize: 14,
                  color: themeListener.isDark ? Colors.white : Colors.black
                    ..withOpacity(0.5))
              // Theme.of(context).textTheme.titleMedium!
              // .copyWith(color: mainColor)
              ,
            ),
          ],
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: follow == false ? 50 : 30),
            child: GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print("CLICKED ON NOTIFIY CARD");
                }
              },
              child: Image.asset(
                "assets/messageShape.png",
                height: 64,
                width: 64,
              ),
              // child: MainButton(
              //   // height: 40,
              //   // color: follow == false ? primary : form,
              //   // textColor: follow == false ? Colors.white : mainText,
              //   // onTap: () {
              //   //   setState(() {
              //   //     follow = !follow;
              //   //   });
              //   // },
              //   text: "Order Status",
              //   onPressed: () {
              //     follow = !follow;
              //     if (kDebugMode) {
              //       print("CLICKED ON Status CARD");
              //     }
              //   },
              // ),
            ),
          ),
        )
      ],
    );
  }
}
