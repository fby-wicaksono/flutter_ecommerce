import 'package:flutter_ecommerce/model/product.dart';
import 'package:flutter_ecommerce/module/dashboard/notifier/home_page_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeNotifierProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, List<Product>>((ref) => HomePageNotifier(ref));
