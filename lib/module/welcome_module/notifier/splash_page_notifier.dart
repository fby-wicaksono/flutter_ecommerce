import 'package:flutter_ecommerce/module/welcome_module/notifier/splash_page_state.dart';
import 'package:flutter_ecommerce/provider/app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPageNotifier extends StateNotifier<SplashPageState> {
  SplashPageNotifier(this.ref, {SplashPageState? initialState}): super(initialState ?? const SplashPageState.initial());

  final Ref ref;

  void checkUserOnBoardingStatus() async {
    final hasUserOnboard = ref.read(prefManagerProvider).hasUserOnboard;
    final hasLoggedIn = ref.read(prefManagerProvider).hasUserLogin;

    // Bad practice to put delay here, but this is needed so user can see splash screen
    await Future.delayed(const Duration(seconds: 2));

    state = SplashPageState.checkOnboardSuccess(hasUserOnboard, hasLoggedIn);
  }
}
