import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/provider/home_provider.dart';
import 'package:flutter_ecommerce/widget/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeNotifierProvider.notifier).getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(homeNotifierProvider);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: saleBannerImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag),
                )
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => ProductItem(productList[index]),
                  childCount: productList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 5 / 9
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
