// ignore_for_file: unnecessary_import, unused_import

import 'package:arriada_group01/screens/main_screens/home_screen.dart';
import 'package:arriada_group01/screens/sub_screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:arriada_group01/helpers/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../providers/dark_theme_provider.dart';
import 'custom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/sales1.png'),
            )),
          ),
          Positioned(
            left: 30,
            top: 30 + MediaQuery.of(context).padding.top,
            child: InkWell(
              child: ClipOval(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => NavbarScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: themeListener.isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      right: 30,
                      left: 30,
                    ),
                    child: Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.app,
                        style: TextStyle(
                          color:
                              themeListener.isDark ? Colors.white : mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.dessc,
                            style: TextStyle(
                              color: themeListener.isDark
                                  ? Colors.white
                                  : mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FavouriteScreen()));
                            },
                            icon: Icon(
                              Icons.favorite_outline_rounded,
                              color: themeListener.isDark
                                  ? Colors.white
                                  : mainColor,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      AppLocalizations.of(context)!.taw,
                      style: TextStyle(
                        color:
                            themeListener.isDark ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 49,
                        width: 49,
                        decoration: BoxDecoration(
                            color: lightGreyColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 94,
                        width: 100,
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 49,
                        width: 49,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      color: themeListener.isDark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.total,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: themeListener.isDark
                                        ? Colors.white
                                        : mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '33.00D.L',
                                style: TextStyle(
                                    color: themeListener.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Material(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              print("click");
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.addto,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
