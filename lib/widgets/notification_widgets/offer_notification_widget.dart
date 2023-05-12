import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomOfferNotifcation extends StatelessWidget {
  const CustomOfferNotifcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Stack(children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 25,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
            ),
            Positioned(
              bottom: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 25,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
            ),
          ]),
        ),
        // const SizedBox(
        //   width: 5,
        // ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                maxLines: 2,
                text: TextSpan(
                    text:  AppLocalizations.of(context)!.appl,
                 
                    style: TextStyle(
                        fontSize: 16,
                        color: themeListener.isDark
                            ? Colors.white
                            : Colors.black)),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(AppLocalizations.of(context)!.has,
               
                  style: TextStyle(
                    
                      fontSize: 14, color: Colors.black.withOpacity(0.5)))
            ],
          ),
        ),
        GestureDetector(
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
        ),
      ],
    );
  }
}
