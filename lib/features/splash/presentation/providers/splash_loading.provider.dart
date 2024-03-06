import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_loading.provider.g.dart';

@riverpod
FutureOr<void> splashLoading(SplashLoadingRef ref) {
  return Future.delayed(const Duration(seconds: 0), () {});
}
