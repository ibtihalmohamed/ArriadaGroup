import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/cart_widgets/cart_checkout.dart';
import '../../widgets/cart_widgets/single_cart_prodct.dart';
import '../main_screens/custom_nav_bar.dart';
import '../sub_sub_screens/Payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              CupertinoButton(
                onPressed: () {
                  // appProvider.clearBuyProduct();
                  // appProvider.addBuyProductCartList();
                  // appProvider.clearCart();
                  if (appProvider.getBuyProductList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Ready to Pay"),
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => CartItemCheckout()));
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => PaymentScreen()));
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaymentScreen()));
                    },
                    child: Text("Checkout",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NavbarScreen()));
            //  //navigate back to the cart screen
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              }),
    );
  }
}
