import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/module/dashboard/page/home_page.dart';
import 'package:flutter_ecommerce/provider/repository_provider.dart';
import 'package:flutter_ecommerce/util/helper.dart';
import 'package:flutter_ecommerce/widget/product_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_util/mock/repository_mock.mocks.dart';
import '../test_util/test_model.dart';
import '../test_util/test_util.dart';

void main() {
  late MockHomeRepository mockHomeRepo;

  final productListSample = [
    buildProductFromTemplate(),
    buildProductFromTemplate(
      name: 'product name 2',
      description: 'description product 2',
    ),
    buildProductFromTemplate(
      name: 'product name 3',
      description: 'description product 3',
    ),
  ];

  setUp(() {
    mockHomeRepo = MockHomeRepository();
  });

  testWidgets('''
  Given Home page opened
  Then all UI will be displayed accordingly
  ''', (tester) async {
    when(mockHomeRepo.getAllProduct()).thenAnswer((_) async => productListSample);

    await tester.pumpWidget(TestApp(
      overrides: [homeRepositoryProvider.overrideWithValue(mockHomeRepo)],
      child: const HomePage(),
    ));

    await tester.pumpAndSettle();

    expect(find.widgetWithText(ProductItem, 'product name 1'), findsOneWidget);
    expect(find.widgetWithText(ProductItem, 'description product 1'), findsOneWidget);

    expect(find.widgetWithText(ProductItem, 'product name 2'), findsOneWidget);
    expect(find.widgetWithText(ProductItem, 'description product 2'), findsOneWidget);

    expect(find.widgetWithText(ProductItem, formatToIDR(1000)), findsNWidgets(2));

    expect(find.widgetWithIcon(IconButton, Icons.shopping_bag), findsOneWidget);
  });
}
