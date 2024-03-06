import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/logs/custom_talker_router_observer.dart';
import 'package:starring_u/features/shared/presentation/pages/error_page.dart';

import 'config.routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  final initialLocation = ref.watch(initialLocationProvider);

  final router = GoRouter(
      navigatorKey: key,
      initialLocation: initialLocation,
      routes: $appRoutes,
      errorBuilder: (context, state) => const ErrorPage(),
      observers: [CustomTalkerRouterObserver(talker, ref)]);

  ref.onDispose(router.dispose);

  return router;
}

@riverpod
String initialLocation(InitialLocationRef ref) => "/splash";
