import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/module/welcome_module/page/login_page.dart';
import 'package:flutter_ecommerce/widget/general_text_input.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_util/test_util.dart';

void main() {
  testWidgets('''
  Given on Login page opened
  Then all UI will be displayed accordingly
  ''', (tester) async {
    await tester.pumpWidget(const TestApp(child: LoginPage()));

    await tester.pumpAndSettle();

    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.widgetWithText(GeneralTextInput, 'Username'), findsOneWidget);
    expect(find.widgetWithText(GeneralTextInput, 'Password'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}