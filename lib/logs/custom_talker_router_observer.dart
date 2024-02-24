import 'package:flutter/src/widgets/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

final routeStateProvider = StateProvider<dynamic>((ref) => "/");

class CustomTalkerRouterObserver extends TalkerRouteObserver {
  final Ref _ref;
  CustomTalkerRouterObserver(super.talker, this._ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute == null || previousRoute.settings.name == null) {
      return;
    }

    Future.microtask(() {
      _ref.read(routeStateProvider.notifier).state =
          previousRoute.settings.name;
    });
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == null) {
      return;
    }

    Future.microtask(() {
      _ref.read(routeStateProvider.notifier).state = route.settings.name;
    });
  }
}
