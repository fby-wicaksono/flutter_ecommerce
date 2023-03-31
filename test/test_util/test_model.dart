import 'package:flutter_ecommerce/model/product.dart';

Product buildProductFromTemplate(
    {int id = 1,
    String name = 'product name 1',
    String description = 'description product 1',
    int price = 1000,
    int quantity = 3}) {
  return Product(
    id: id,
    name: name,
    description: description,
    price: price,
    quantity: quantity,
  );
}
