import 'package:arriada_group01/screens/sub_sub_screens/edit_profile.dart';
import 'package:arriada_group01/screens/sub_sub_screens/help_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../screens/sub_sub_screens/settings.dart';
import '../../main.dart';
import '../../screens/sub_sub_screens/settings_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text:    AppLocalizations.of(context)!.account,
      
            icon: "assets/icons/User Icon.svg",
        
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfileScreen()))
            },
          ),
          // ProfileMenu(
          //   text: "Notifications",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: 
               AppLocalizations.of(context)!.settings,
            icon: "assets/icons/Settings.svg",
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()))
            },
          ),
          ProfileMenu(
            text: 
                       AppLocalizations.of(context)!.help ,
            icon: "assets/icons/Question mark.svg",
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Helpscreen()))
            },
          ),
          ProfileMenu(
            text:   AppLocalizations.of(context)!.log ,
            icon: "assets/icons/Log out.svg",
            press: () => {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => MyApp()),
                    (route) => false);
              }), //ask mohammed why does it sign out in the debug console but nothing change in the app??
            },
          ),
        ],
      ),
    );
  }
}
