import 'package:arriada_group01/main.dart';
import 'package:arriada_group01/screens/sub_screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/constants.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/static_widgets/main_button_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProfileScreen()));
                  //  //navigate back to the cart screen
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 24,
                    color: themeListener.isDark ? Colors.white : mainColor,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            buildNotificationOptionRow("Dark Mode", themeListener.isDark),
            Text(
              "Language :",
              style: TextStyle(
                  fontSize: 19,
                  color: themeListener.isDark
                      ? Colors.white
                      : Colors.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
                text: "ARABIC",
                onPressed: () {
                  MyApp.setLocale(context, Locale("ar"));
                }),
            SizedBox(
              height: 10,
            ),
            MainButton(
                text: "ENGLISH",
                onPressed: () {
                  MyApp.setLocale(context, Locale("en"));
                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {
                themeListener.switchMode();
              },
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Option 1"),
                    Text("Option 2"),
                  ],
                ),
                // actions: [
                //   FlatButton(
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //       child: Text("Close")),
                // ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
