import 'package:arriada_group01/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.text,
    required this.clickabletext,
  }) : super(key: key);
  final String text;
  final String clickabletext;
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 20,
      shadowColor: Colors.black26,
      child: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: themeListener.isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    color: themeListener.isDark ? Colors.white : Colors.black),
              ),
              SizedBox(
                width: 190,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // navigate to the map screen to change the address
                },
                child: Text(
                  clickabletext,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
              ),
            ],
          )),
    );
  }
}
