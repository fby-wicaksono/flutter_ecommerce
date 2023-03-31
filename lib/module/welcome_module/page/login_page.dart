import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/module/welcome_module/notifier/login_page_state.dart';
import 'package:flutter_ecommerce/provider/login_provider.dart';
import 'package:flutter_ecommerce/util/helper.dart';
import 'package:flutter_ecommerce/widget/general_text_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/app_router.gr.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    ref.listen(loginPageNotifierProvider, (_, state) {
      if (state is LoginPageStateFailed) {
        ScaffoldMessenger.of(context).showSnackBar(generalAppSnackbar(message: state.errorMessage));
      } else if (state is LoginPageStateSuccess) {
        context.router.replace(const DashboardRoute());
      }
    });

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome!',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 20.0),
              GeneralTextInput(label: 'Username', controller: _usernameController),
              const SizedBox(height: 8.0),
              GeneralTextInput(
                label: 'Password',
                controller: _passwordController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(onPressed: _onLoginButtonPressed, child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    ref.read(loginPageNotifierProvider.notifier).checkLoginCredibility(
        _usernameController.text, _passwordController.text);
  }
}
