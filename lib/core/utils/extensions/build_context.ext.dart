import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextTheme get txtTheme => Theme.of(this).textTheme;
}
