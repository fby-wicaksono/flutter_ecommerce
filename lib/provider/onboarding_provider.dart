import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = StateProvider.autoDispose<int>((ref) => 0);

final isPreviousButtonEnabledProvider = Provider.autoDispose<bool>((ref) {
  final currentPage = ref.watch(currentPageProvider);

  if (currentPage == 0) {
    return false;
  }

  return true;
});

final isFinalPageProvider = Provider.autoDispose<bool>((ref) {
  final currentPage = ref.watch(currentPageProvider);

  return currentPage == 2;
});