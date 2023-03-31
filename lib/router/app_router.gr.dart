// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../model/product.dart' as _i10;
import '../module/dashboard/page/account_page.dart' as _i7;
import '../module/dashboard/page/dashboard_page.dart' as _i4;
import '../module/dashboard/page/home_page.dart' as _i6;
import '../module/product/page/product_detail_page.dart' as _i5;
import '../module/welcome_module/page/login_page.dart' as _i3;
import '../module/welcome_module/page/onboarding_page.dart' as _i2;
import '../module/welcome_module/page/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AccountPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i8.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i8.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i8.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          ProductDetailRoute.name,
          path: '/productDetail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.ProductDetailPage]
class ProductDetailRoute extends _i8.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i9.Key? key,
    required _i10.Product product,
  }) : super(
          ProductDetailRoute.name,
          path: '/productDetail',
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
  });

  final _i9.Key? key;

  final _i10.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}
