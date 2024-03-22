import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/logs/custom_talker_router_observer.dart';
import 'package:starring_u/core/shared/presentation/pages/error_page.dart';

import 'config.routes.dart';

part 'router.g.dart';

@riverpod

/// Creates and configures a GoRouter instance.
///
/// The created router is configured with the initial location provider, app
/// routes, an error page, and a custom talker router observer. The router is
/// also disposed of when the dependency is disposed.
///
/// The router is returned as a [GoRouter] instance.
GoRouter router(RouterRef ref) {
  // Create a key for the navigator
  final key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  // Get the initial location from the provider
  final initialLocation = ref.watch(initialLocationProvider);

  // Create and configure the router
  final router = GoRouter(
    // Assign the navigator key
    navigatorKey: key,
    // Set the initial location
    initialLocation: initialLocation,
    // Set the app routes
    routes: $appRoutes,
    // Set the error page
    errorBuilder: (context, state) => const ErrorPage(),
    // Add the custom talker router observer
    observers: [CustomTalkerRouterObserver(talker, ref)],
  );

  // Dispose of the router when the dependency is disposed
  ref.onDispose(router.dispose);

  return router;
}

@riverpod
String initialLocation(InitialLocationRef ref) => "/splash";
