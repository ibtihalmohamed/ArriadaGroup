import 'package:arriada_group01/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../providers/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: themeListener.isDark
            ? Colors.white70
            : creamyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: searchController,
        onChanged: (value) {
          Provider.of<ProductProvider>(context, listen: false)
              .filteringProducts(searchController.text);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: AppLocalizations.of(context)!.search,
            hintStyle: TextStyle(
                color: themeListener.isDark ? Colors.white : Colors.black),
            prefixIcon: Icon(Icons.search,
                color: themeListener.isDark ? Colors.white : Colors.black)),
      ),
    );
  }
}
