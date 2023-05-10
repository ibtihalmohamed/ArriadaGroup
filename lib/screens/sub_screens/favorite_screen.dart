import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/favorite_widgets/favorite_product_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colo,
        title: Text(
          
          "Favourite Screen",
          style: TextStyle(
            color: themeListener.isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? Center(
              child: Text(
                "Empty",
                style: TextStyle(
                    color: themeListener.isDark ? Colors.white : Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: appProvider.getFavouriteProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              }),
    );
  }
}
