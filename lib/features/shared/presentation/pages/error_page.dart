import 'dart:io';

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;

  const ErrorPage({
    this.errorMessage,
    super.key,
  });

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
              errorMessage != null
                  ? 'An error occurred: $errorMessage'
                  : "Something went wrong...",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            if (Navigator.of(context).canPop() && Platform.isAndroid)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go Back'),
              ),
          ],
        ),
      ),
    );
  }
}
