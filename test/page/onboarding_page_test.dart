import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/module/welcome_module/page/onboarding_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_util/test_util.dart';

void main() {
  testWidgets('''
  Given on boarding page opened
  Then all UI will be displayed accordingly
  ''', (tester) async {
    await tester.pumpWidget(const TestApp(child: OnboardingPage()));

    await tester.pumpAndSettle();

    expect(find.widgetWithText(OnboardingInfo, 'Easy Shopping'), findsOneWidget);
    expect(
        find.widgetWithText(
            OnboardingInfo, 'Our designer & engineers work hard to make sure you have a wonderful shopping experience'),
        findsOneWidget);
    expect(find.widgetWithImage(OnboardingInfo, easyShoppingImage), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Previous'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Next'), findsOneWidget);
  });
}
