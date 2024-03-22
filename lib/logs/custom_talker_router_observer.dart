import 'package:flutter/src/widgets/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'custom_talker_router_observer.g.dart';

/// The CurrentRoute class is a provider that holds the current route as a
/// string.
///
/// This provider is used to keep track of the current route using the
/// TalkerRouteObserver.
@riverpod
class CurrentRoute extends _$CurrentRoute {
  /// Returns the current route as a string.
  ///
  /// This function is called by the provider and its return value is used to
  /// initialize the provider's state.
  @override
  String build() {
    return "/";
  }

  /// Updates the current route to the provided [currentRoute].
  ///
  /// This function is called by the TalkerRouteObserver when a route is pushed
  /// or popped. It updates the provider's state to the new current route.
  void updateRoute(String currentRoute) => state = currentRoute;
}

/// The CustomTalkerRouterObserver class is a route observer that updates the
/// current route provider (CurrentRoute) whenever a route is pushed or popped.
///
/// This observer is used to keep track of the current route using the
/// TalkerRouteObserver.
class CustomTalkerRouterObserver extends TalkerRouteObserver {
  /// The reference to the provider's notifier that will be updated.
  final Ref _ref;

  /// Creates a new instance of the CustomTalkerRouterObserver class.
  ///
  /// The [talker] parameter is the Talker instance that will be used to log
  /// route changes. The [ref] parameter is the reference to the provider's
  /// notifier that will be updated.
  CustomTalkerRouterObserver(super.talker, this._ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute == null || previousRoute.settings.name == null) {
      return;
    }
    Future.microtask(() => _ref
        .read(currentRouteProvider.notifier)
        .updateRoute(previousRoute.settings.name!));
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == null) {
      return;
    }

    Future.microtask(() => _ref
        .read(currentRouteProvider.notifier)
        .updateRoute(route.settings.name!));
  }
}
