// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../models/cart_model.dart';

// class CartProvider with ChangeNotifier {
//   List<CartModel> products = [];

//   getProducts() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     var data = await firestore.collection('cartData').get();
//     List<CartModel> converteddata = [];
//     data.docs.forEach((element) {
//       converteddata.add(CartModel.fromJson(element.data()));
//     });

//     setProducts(converteddata);
//   }

//   setProducts(List<CartModel> productsData) {
//     products = productsData;
//     notifyListeners();
//   }
// }
