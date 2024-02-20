// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $narratorRoute,
      $splashRoute,
      $errorRoute,
    ];

RouteBase get $narratorRoute => GoRouteData.$route(
      path: '/',
      factory: $NarratorRouteExtension._fromState,
    );

extension $NarratorRouteExtension on NarratorRoute {
  static NarratorRoute _fromState(GoRouterState state) => const NarratorRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $errorRoute => GoRouteData.$route(
      path: '/error',
      factory: $ErrorRouteExtension._fromState,
    );

extension $ErrorRouteExtension on ErrorRoute {
  static ErrorRoute _fromState(GoRouterState state) => ErrorRoute(
        $errorMessage: state.uri.queryParameters[r'$error-message'],
      );

  String get location => GoRouteData.$location(
        '/error',
        queryParams: {
          if ($errorMessage != null) r'$error-message': $errorMessage,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
