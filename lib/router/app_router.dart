import 'package:auto_route/annotations.dart';
import 'package:flutter_ecommerce/module/dashboard/page/account_page.dart';
import 'package:flutter_ecommerce/module/dashboard/page/dashboard_page.dart';
import 'package:flutter_ecommerce/module/dashboard/page/home_page.dart';
import 'package:flutter_ecommerce/module/product/page/product_detail_page.dart';
import 'package:flutter_ecommerce/module/welcome_module/page/login_page.dart';
import 'package:flutter_ecommerce/module/welcome_module/page/onboarding_page.dart';
import 'package:flutter_ecommerce/module/welcome_module/page/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: OnboardingPage,
      path: '/onboarding',
    ),
    AutoRoute(
      page: LoginPage,
      path: '/login',
    ),
    AutoRoute(
      page: DashboardPage,
      path: '/dashboard',
      children: [
        AutoRoute(page: HomePage, path: ''),
        AutoRoute(page: AccountPage, path: 'account'),
      ],
    ),
    AutoRoute(
      page: ProductDetailPage,
      path: '/productDetail',
    ),
  ],
)
class $AppRouter {}