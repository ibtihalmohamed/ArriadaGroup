import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import 'product_card_widget.dart';
import 'section_title_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? categoryQuery;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, product, _) {
      return Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
              title: AppLocalizations.of(context)!.popular,
              press: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .getProducts(categoryQuery);
              }),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('Products')
              //         .snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (!snapshot.hasData) {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //       return ListView(
              //           children: snapshot.data.docs.map((document) {
              //         return Container(
              //           child: Center(child: Text(document['text'])),
              //         );
              //       }).toList());
              //     })
            ])),
        SizedBox(
          height: 220,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: product.ProductsList.length,
              itemBuilder: (context, index) {
                return ProductCard(product: product.ProductsList[index]);
              }),
        )
      ]);
    });
  }
}
