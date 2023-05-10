import 'package:arriada_group01/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleFavouriteItem extends StatefulWidget {
  //i dont like the fav screen
  // final ProductModel singleProduct;
  const SingleFavouriteItem({
    super.key, required singleProduct,
  });

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 120),
        // margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(color: mainColor, width: 3),
        ),

        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 140,
                color: mainColor.withOpacity(0.5),
                child: Image.asset("assets/arriada.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Iphone 14 pro max",
                                // widget.singleProduct.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                onPressed: () {
                                  // AppProvider appProvider =
                                  //     Provider.of<AppProvider>(context,
                                  //         listen: false);
                                  // appProvider
                                  //     .removeFavouriteProduct(widget.singleProduct);
                                  // showMessage("Removed to wishlist");
                                },
                                child: const Text(
                                  "Remove to wishlist",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
                          Text(
                            "8900 LYD",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: mainColor,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
