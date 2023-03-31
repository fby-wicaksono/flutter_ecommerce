import 'package:flutter_ecommerce/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) => HomeRepository());