import 'package:flutter_ecommerce/module/welcome_module/notifier/login_page_state.dart';
import 'package:flutter_ecommerce/provider/app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageNotifier extends StateNotifier<LoginPageState>{
  LoginPageNotifier(this.ref, {LoginPageState? initialState}) : super(initialState ?? const LoginPageState.initial());

  final Ref ref;

  void checkLoginCredibility(String username, String password) {
    if (username.isEmpty && password.isEmpty) {
      state = const LoginPageState.failed('Username & password cannot be empty');
      return;
    }

    if (username.isEmpty) {
      state = const LoginPageState.failed('Username cannot be empty');
      return;
    }

    if (password.isEmpty) {
      state = const LoginPageStateFailed('password cannot be empty');
      return;
    }

    ref.read(prefManagerProvider).setDoneLogin(username);

    state = const LoginPageStateSuccess();
  }
}