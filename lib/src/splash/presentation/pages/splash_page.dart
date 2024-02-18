import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starring_u/router/config.routes.dart';

import '../../../shared/presentation/widgets/standard_error_widget.dart';
import '../../../shared/presentation/widgets/standard_loading_widget.dart';
import '../providers/splash_loading.provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(splashLoadingProvider);

    return Scaffold(
      body: Center(
        child: switch (loading) {
          AsyncData() => const Icon(
              CupertinoIcons.flag_circle,
              size: 50,
            )
                .animate()
                .fadeIn(duration: 200.milliseconds)
                .fadeOut(duration: 800.milliseconds)
                .then()
                .callback(
                    callback: (value) => const NarratorRoute().go(context)),
          AsyncError(:final error, :final stackTrace) =>
            StandardErrorWidget(error, stackTrace),
          _ => const StandardLoadingWidget()
        },
      ),
    );
  }
}
