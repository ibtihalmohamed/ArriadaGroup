import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/widgets/payment_widgets/Address_widget.dart';
import 'package:arriada_group01/widgets/static_widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';
import '../../widgets/payment_widgets/payment_card_widget.dart';
import '../handling_screens/suceess_order_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => CartScreen()));
                      //  //navigate back to the cart screen
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: themeListener.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 24,
                        color: themeListener.isDark ? Colors.white : mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 18,
                    color: themeListener.isDark ? Colors.white : mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AddressCard(
                  text: "Benghazi,\nvenice st.", clickabletext: "change"),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 18,
                    color: themeListener.isDark ? Colors.white : mainColor,
                  ),
                ),
              ),
              PaymentCard(
                image: 'assets/sadad.png',
                text: 'sadad',
              ),
              SizedBox(
                height: 10,
              ),
              PaymentCard(
                image: 'assets/mobicash.png',
                text: 'mobi cash',
              ),
              SizedBox(
                height: 10,
              ),
              PaymentCard(
                image: 'assets/tdawal.png',
                text: 'tadawal',
              ),
              SizedBox(
                height: 10,
              ),
              PaymentCard(text: "cash on delivery", image: 'assets/logo.png'),
              SizedBox(
                height: 140,
              ),
              MainButton(
                  text: "Confirm Payment",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessOrderScreen()));
                  }),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
