// ignore_for_file: unnecessary_import, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../../helpers/constants.dart';
import '../../helpers/enum.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/profile_widgets/body.dart';
import '../main_screens/custom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeListener.isDark ? Colors.black : Colors.white,
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: TextStyle(
            color: themeListener.isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: const ProfileBody(),
    );
  }
}
