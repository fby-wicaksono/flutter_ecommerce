import 'package:flutter_ecommerce/model/product.dart';
import 'package:flutter_ecommerce/provider/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifier extends StateNotifier<List<Product>> {
  HomePageNotifier(this.ref, {List<Product>? initialList}) : super(initialList ?? []);

  final Ref ref;

  void getAllProduct() async {
    final repo = ref.read(homeRepositoryProvider);

    final productList = await repo.getAllProduct();

    state = productList;
  }
}