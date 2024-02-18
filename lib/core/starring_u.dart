import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starring_u/router/router.dart';
import 'package:starring_u/theme/dark_theme.dart';
import 'package:starring_u/theme/light_theme.dart';

class StarringU extends ConsumerWidget {
  const StarringU({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
