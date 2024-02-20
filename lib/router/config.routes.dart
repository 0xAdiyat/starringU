import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starring_u/src/narattor/presentation/pages/narrator_page.dart';
import 'package:starring_u/src/splash/presentation/pages/splash_page.dart';

import '../src/shared/presentation/pages/error_page.dart';

part 'config.routes.g.dart';

@TypedGoRoute<NarratorRoute>(path: "/")
class NarratorRoute extends GoRouteData {
  const NarratorRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NarratorPage();
  }
}

@TypedGoRoute<SplashRoute>(path: "/splash")
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<ErrorRoute>(path: "/error")
class ErrorRoute extends GoRouteData {
  final String? $errorMessage;
  const ErrorRoute({
    this.$errorMessage,
  });
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ErrorPage(
      errorMessage: $errorMessage,
    );
  }
}
