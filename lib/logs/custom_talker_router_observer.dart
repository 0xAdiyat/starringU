import 'package:flutter/src/widgets/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'custom_talker_router_observer.g.dart';

@riverpod
class CurrentRoute extends _$CurrentRoute {
  @override
  String build() {
    return "/";
  }

  void updateRoute(String currentRoute) => state = currentRoute;
}

class CustomTalkerRouterObserver extends TalkerRouteObserver {
  final Ref _ref;
  CustomTalkerRouterObserver(super.talker, this._ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute == null || previousRoute.settings.name == null) {
      return;
    }
    Future.microtask(() =>
      _ref
          .read(currentRouteProvider.notifier)
          .updateRoute(previousRoute.settings.name!)
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == null) {
      return;
    }

    Future.microtask(() =>
      _ref
          .read(currentRouteProvider.notifier)
          .updateRoute(route.settings.name!)
    );
  }
}
