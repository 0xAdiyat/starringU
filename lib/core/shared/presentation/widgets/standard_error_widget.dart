import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StandardErrorWidget extends ConsumerWidget {
  const StandardErrorWidget(
    this.error,
    this.stackTrace, {
    super.key,
    this.message,
    this.icon,
  });
  final Object? error;
  final StackTrace stackTrace;
  final String? message;
  final IconData? icon;

  @override

  /// Standard error widget for displaying errors.
  ///
  /// This widget is a standard way of displaying errors in the app.
  /// It displays an error icon, a title and the error message.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // The scaffold that holds the error widget
      body: Center(
        // The center widget that centers the error widget
        child: Column(
          // The column widget that holds the error icon and the title
          mainAxisSize: MainAxisSize.min,
          // The column's size will be as small as possible
          mainAxisAlignment: MainAxisAlignment.center,
          // The column's children will be centered vertically
          children: [
            // The error icon
            Icon(icon ?? Icons.sentiment_very_dissatisfied),
            // The title of the error
            Text(message ?? 'Something went wrong..'),
          ],
        ),
      ),
    );
  }
}
