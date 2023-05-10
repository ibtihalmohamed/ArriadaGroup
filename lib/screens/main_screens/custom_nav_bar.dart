import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/screens/sub_screens/favorite_screen.dart';
import 'package:arriada_group01/screens/sub_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   FirebaseFirestore firestore = FirebaseFirestore.instance;
      //   firestore.collection('productsData').add(ProductModel(
      //           id: "1",
      //           title: 'MAC',
      //           description: "MACBOOK",
      //           image:
      //               "https://cdn2.vox-cdn.com/uploads/chorus_asset/file/7390261/vpavic_161031_1256_0264.0.jpg",
      //           price: 5000.0,
      //           rating: 4.9)
      //       .toJson());
      // }),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          color: mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0.2),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: GNav(
              // backgroundColor: mainColor,
              activeColor: Colors.white,
              tabBackgroundColor: creamyColor.withOpacity(0.2),
              padding: const EdgeInsets.all(10),
              // tabBorderRadius: 11,
              color: Colors.white,
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: AppLocalizations.of(context)!.home,
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: AppLocalizations.of(context)!.likes,
                ),
                GButton(
                  icon: Icons.person_outlined,
                  text: AppLocalizations.of(context)!.profile,
                ),
              ],
              onTabChange: onTapped,
              selectedIndex: _selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
