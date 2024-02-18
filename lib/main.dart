import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/starring_u.dart';
import 'package:starring_u/logs/starring_u_provider_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
      observers: [StarringUProviderObserver(talker)],
      child: const StarringU()));
}
