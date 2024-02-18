import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/core/starring_u.dart';
import 'package:starring_u/logs/starring_u_provider_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) => talker.handle(
        details.exception,
        switch (details.stack) {
          final value? => Trace.from(value).terse,
          _ => null,
        },
        details.exceptionAsString(),
      );

  runApp(ProviderScope(
      observers: [StarringUProviderObserver(talker)],
      child: const StarringU()));
}
