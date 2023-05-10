import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/screens/sub_screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helpscreen extends StatefulWidget {
  const Helpscreen({super.key});

  @override
  _HelpscreenState createState() => _HelpscreenState();
}

class _HelpscreenState extends State<Helpscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 1,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios_rounded,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
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
                ),
              ),
              Expanded(
                child: Text(
                  "Help center",
                  style: TextStyle(fontSize: 24, color: mainColor),
                ),
              ),
            ]),
            // const Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            const SizedBox(
              height: 20,
            ),
            buildAccountOptionRow(context, "Report a Problem"),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Account Status"),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Help Center"),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Privacy and Security  Help"),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Support Requests"),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
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
              onChanged: (bool val) {},
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
                    Text("Option 3"),
                  ],
                ),
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
