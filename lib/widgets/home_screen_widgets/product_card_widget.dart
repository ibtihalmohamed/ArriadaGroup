// ignore_for_file: unused_import

import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../screens/main_screens/detailes_screen.dart';
import '../static_widgets/loading_logo.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 120,
    required this.product,
  }) : super(key: key);

  final double width;
  final ApiProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    return Padding(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: size.width * 0.66,
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen,
          //   // arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width,
                // constraints: BoxConstraints(maxWidth: 200),
                //  padding: EdgeInsets.all((20)),
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.id.toString(), // from product model
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.images!.first.toString(),
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: LoadingLogo());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                              child: Icon(
                            Icons.image,
                            color: themeListener.isDark
                                ? lightWihteColor
                                : darkGreyColor,
                          ));
                        },
                        width: size.width * 0.66,
                        height: size.width * 0.33,
                      )),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      color: themeListener.isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    "\LYD${product.price}",
                    style: TextStyle(
                      fontSize: (14),
                      fontWeight: FontWeight.w600,
                      color: themeListener.isDark ? Colors.white : mainColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
