import 'package:flutter_ecommerce/module/welcome_module/notifier/login_page_notifier.dart';
import 'package:flutter_ecommerce/module/welcome_module/notifier/login_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageNotifierProvider =
    StateNotifierProvider<LoginPageNotifier, LoginPageState>((ref) => LoginPageNotifier(ref));
