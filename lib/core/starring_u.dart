import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:starring_u/router/router.dart';

import 'utils/themes/app_theme.dart';

class StarringU extends ConsumerWidget {
  const StarringU({super.key});

  @override
  /// Builds a MaterialApp.router widget using the provided `BuildContext` and `WidgetRef`.
  ///
  /// The `BuildContext` parameter is used to access the current build context.
  /// The `WidgetRef` parameter is used to watch the router provider.
  ///
  /// Returns a MaterialApp.router widget configured with the router provider,
  /// light theme, and dark theme.
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
