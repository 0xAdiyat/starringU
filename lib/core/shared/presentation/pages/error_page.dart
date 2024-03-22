import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;

  const ErrorPage({
    this.errorMessage,
    super.key,
  });

  /// A widget that displays an error page to the user.
  ///
  /// This widget is displayed when an error occurs in the app.
  /// It shows a title, a description of the error and a button to go back.
  /// If the user is on Android, it also provides a button to go back.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage ?? 'An error occurred',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            if (Navigator.of(context).canPop())
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Go Back'),
              ),
          ],
        ),
      ),
    );
  }
}
