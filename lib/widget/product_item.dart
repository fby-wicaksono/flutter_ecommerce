import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/model/product.dart';
import 'package:flutter_ecommerce/router/app_router.gr.dart';
import 'package:flutter_ecommerce/util/helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this._product, {super.key, this.cardMargin});

  final Product _product;
  final EdgeInsets? cardMargin;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => _pushToProductDetail(context, _product),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                ),
                child: Image(
                  image: productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name,
                      style: textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _product.description,
                      style: textStyle.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatToIDR(_product.price),
                      style: textStyle.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pushToProductDetail(BuildContext context, Product product) {
    context.router.push(ProductDetailRoute(product: product));
  }
}
