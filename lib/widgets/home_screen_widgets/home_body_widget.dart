// ignore_for_file: must_be_immutable

import 'package:arriada_group01/providers/product_provider.dart';
import 'package:arriada_group01/widgets/home_screen_widgets/discount_banner_widget.dart';
import 'package:arriada_group01/widgets/home_screen_widgets/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'popular_products_widget.dart';
import 'categories_widgets.dart';
import 'special_offers_widgets.dart';

class HomeBody extends StatelessWidget {
  String? categoryQuery;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(builder: (context, product, _) {
        return RefreshIndicator(
          onRefresh: () async {
            Provider.of<ProductProvider>(context, listen: false)
                .getProducts(categoryQuery);
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  HomeHeader(),
                  SizedBox(height: (10)),
                  DiscountBanner(),
                  Categories(),
                  SpecialOffers(),
                  SizedBox(height: (30)),
                  PopularProducts(),
                  SizedBox(height: (30)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
