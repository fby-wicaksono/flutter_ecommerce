import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/image_config.dart';
import 'package:flutter_ecommerce/provider/app_provider.dart';
import 'package:flutter_ecommerce/provider/onboarding_provider.dart';
import 'package:flutter_ecommerce/router/app_router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingPage> {
  final _pageViewController = PageController();

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPreviousButtonEnabled = ref.watch(isPreviousButtonEnabledProvider);
    final isFinalPage = ref.watch(isFinalPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageViewController,
                  onPageChanged: (currentPage) {
                    ref.read(currentPageProvider.notifier).state = currentPage;
                  },
                  children: [
                    OnboardingInfo(
                      title: 'Easy Shopping',
                      description:
                          'Our designer & engineers work hard to make sure you have a wonderful shopping experience',
                      image: easyShoppingImage,
                    ),
                    OnboardingInfo(
                      title: '24 Hours Support',
                      description:
                          'Our customer service will always standby and ready to help you whenever you need them',
                      image: customerSupportImage,
                    ),
                    OnboardingInfo(
                      title: 'Best Deals',
                      description:
                          'We will always make sure to spoil your needs of shopping by giving you the best deals',
                      image: friendlyPriceImage,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isPreviousButtonEnabled ? _onPreviousButtonPressed : null,
                      child: const Text('Previous'),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onNextButtonPressed,
                      child: _getNextButtonText(isFinalPage),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPreviousButtonPressed() {
    final currentPage = ref.read(currentPageProvider.notifier).state;
    _pageViewController.animateToPage(
      currentPage - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onNextButtonPressed() {
    final isLastPage = ref.read(isFinalPageProvider);

    if (isLastPage) {
      ref.read(prefManagerProvider).setUserDoneOnboard();
      context.router.replace(const LoginRoute());

    } else {
      final currentPage = ref.read(currentPageProvider.notifier).state;

      _pageViewController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Text _getNextButtonText(bool isFinalPage) {
    String label = 'Next';

    if (isFinalPage) {
      label = 'Finish';
    }

    return Text(label);
  }
}

class OnboardingInfo extends StatelessWidget {
  const OnboardingInfo({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String title;
  final String description;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25.0,
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Image(image: image),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
