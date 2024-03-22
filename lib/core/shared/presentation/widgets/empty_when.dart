import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'standard_when.dart';

extension StandardWhen<T> on AsyncValue<T> {
  /// Builds a [Widget] based on the current [AsyncValue] state.
  ///
  /// The [data] parameter is called when the state is [AsyncValueState.data].
  /// The [loading] parameter is called when the state is [AsyncValueState.loading].
  /// The [error] parameter is called when the state is [AsyncValueState.error].
  ///
  /// The [skipLoadingOnReload] parameter skips the [loading] widget when the
  /// [AsyncValue] is reloaded.
  /// The [skipLoadingOnRefresh] parameter skips the [loading] widget when the
  /// [AsyncValue] is refreshed.
  /// The [skipError] parameter skips the [error] widget when the state is
  /// [AsyncValueState.error].
  ///
  /// The [data], [loading] and [error] parameters are required.
  Widget emptyWhen({
    required Widget Function(T data) data,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
  }) =>
      standardWhen(
        data: data,
        loading: SizedBox.shrink,
        error: (error, stackTrace) => const SizedBox.shrink(),
        skipError: skipError,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipLoadingOnReload: skipLoadingOnReload,
      );

}
