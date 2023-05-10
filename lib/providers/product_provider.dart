import 'dart:convert';

import 'package:arriada_group01/models/product_model.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailed = false;
  final _api = Api();

  List<ApiProductModel> ProductsList = [];
  // function for getting the products from the api
  getProducts(String? categoryQuery) async {
    isLoading = true;
    notifyListeners();
    var response = await _api.get(
        categoryQuery == null
            ? '/api/v1/products'
            : '/api/v1/products?title=$categoryQuery', //in case of or how to diff if its elec or other
        {});

    if (response.statusCode == 200) {
      var rawData = json.decode(response.body);
      setProducts(rawData);
    }
  }

  setProducts(jsonData) {
    ProductsList.clear();

    for (var i in jsonData) {
      ProductsList.add(ApiProductModel.fromJson(i));
    }

    isLoading = false;
    notifyListeners();
  }

  getSingleProduct(int productId, bool iselectronic) async {
    isLoading = true;
    notifyListeners();
    var response = await _api.get('/api/v1/products?id=$productId', {});

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      var rawData = json.decode(response.body);
    }
  }

  //function that filters the product for the search tap
  filteringProducts(String? searchText) {
    getProducts(searchText);

    //  ProductsList.forEach((element) {
    //     if (!element.title.toString().contains(searchText!)) {
    //       ProductsList.remove(element);
    //       notifyListeners();
    //     }
    // });
  }
}
