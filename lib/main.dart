import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/manager/shared_preference_manager.dart';
import 'package:flutter_ecommerce/provider/app_provider.dart';
import 'package:flutter_ecommerce/provider/repository_provider.dart';
import 'package:flutter_ecommerce/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sPref = SharedPreferenceManager();
  await sPref.init();

  runApp(
    ProviderScope(
      overrides: [
        prefManagerProvider.overrideWithValue(sPref)
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  MainApp({
    Key? key,
  }) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(prefManagerProvider);
    ref.watch(homeRepositoryProvider);

    return MaterialApp.router(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
