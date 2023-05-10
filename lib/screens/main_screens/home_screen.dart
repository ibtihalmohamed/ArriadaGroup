import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../widgets/home_screen_widgets/home_body_widget.dart';
import '../sub_sub_screens/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isloading = false;

  String? categoryQuery;

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getProducts(categoryQuery);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => _isloading
      ? LoadingPage()
      : Scaffold(
          body:
           Consumer<ProductProvider>(builder: (context, productConsumer, _) {
        return HomeBody();
             }
           ),
          // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
        );
}
