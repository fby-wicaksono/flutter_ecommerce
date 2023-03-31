import 'package:flutter_ecommerce/module/welcome_module/notifier/splash_page_notifier.dart';
import 'package:flutter_ecommerce/module/welcome_module/notifier/splash_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashPageStateNotifierProvider =
    StateNotifierProvider.autoDispose<SplashPageNotifier, SplashPageState>((ref) => SplashPageNotifier(ref));
