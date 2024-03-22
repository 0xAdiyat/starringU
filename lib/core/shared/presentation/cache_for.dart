import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  /// Keeps the provider alive for [duration].
  ///
  /// This method ensures that the provider will not be disposed until
  /// [duration] has elapsed, even if the provider is recomputed.
  ///
  /// The provider will be disposed as soon as [duration] has elapsed,
  /// regardless of whether it was recomputed during that time.
  void cacheFor(Duration duration) {
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    final timer = Timer(duration, link.close);

    // When the provider is recomputed (such as with ref.watch),
    // we cancel the pending timer.
    //
    // This ensures that the provider will not be disposed until
    // [duration] has elapsed, even if it is recomputed before that time.
    onDispose(timer.cancel);
  }
}
