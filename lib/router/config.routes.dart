import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'config.routes.g.dart';

@TypedGoRoute<HomeRoute>(path: "/")
class HomeRoute extends GoRouteData {
  const HomeRoute();
}

@TypedGoRoute<SplashRoute>(path: "/splash")
class SplashRoute extends GoRouteData {
  const SplashRoute();
}
