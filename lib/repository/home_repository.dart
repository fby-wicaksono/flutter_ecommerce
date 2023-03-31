import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/model/product.dart';

import 'package:flutter_ecommerce/config/json_file_config.dart';

class HomeRepository {

  Future<List<Product>> getAllProduct() async {
    final jsonString = await rootBundle.loadString(productListFileName);
    List<dynamic> productMapList = json.decode(jsonString);

    final List<Product> productList = [];

    for (final product in productMapList) {
      productList.add(Product.fromJson(product));
    }

    return productList;
  }
}
