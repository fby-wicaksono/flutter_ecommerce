import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/module/welcome_module/notifier/splash_page_state.dart';
import 'package:flutter_ecommerce/provider/splash_page_provider.dart';
import 'package:flutter_ecommerce/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splashPageStateNotifierProvider.notifier).checkUserOnBoardingStatus();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    ref.listen(splashPageStateNotifierProvider, (_, state) {
      if (state is SplashPageStateCheckOnboardSuccess) {
        if (!state.hasOnboard) {
          context.router.replace(const OnboardingRoute());
        } else if (!state.hasLoggedIn) {
          context.router.replace(const LoginRoute());
        } else {
          context.router.replace(const DashboardRoute());
        }
      }
    });

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundSplashImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
