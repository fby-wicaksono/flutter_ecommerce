import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/provider/app_provider.dart';
import 'package:flutter_ecommerce/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Account Info',
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 30.0),
                  CircleAvatar(
                    backgroundImage: profilePictureImage,
                    radius: 60.0,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Alexandria Lowe',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    'alexandria.lowe@mail.com',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: _onPressedLogoutButton,
                    child: const Text('Log out'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressedLogoutButton() {
    ref.read(prefManagerProvider).setLogout();
    context.router.replace(const LoginRoute());
  }
}
