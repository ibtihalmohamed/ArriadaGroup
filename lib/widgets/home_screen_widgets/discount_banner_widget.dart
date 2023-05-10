import 'package:arriada_group01/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color:
            themeListener.isDark ? Colors.white70 : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Offer\n"), // ibtihal localize here****
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
