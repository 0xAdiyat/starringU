import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension CacheFor<T> on AutoDisposeRef<T> {
  /// provides a convenient way to cache a value for a specified duration using Riverpod's automatic disposal mechanism
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);

    /// The onDispose method is used to register a callback that will be called when the reference is disposed of. In this case, it cancels the timer to prevent any memory leaks.
    onDispose(timer.cancel);
  }
}
