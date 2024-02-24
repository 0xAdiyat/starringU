import 'package:flutter/material.dart';
import 'package:starring_u/core/utils/extensions/build_context.ext.dart';

import 'app_fonts.manager.constants.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getBodyLarge(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.bodyLarge!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getBodyMedium(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.bodyMedium!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getBodySmall(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.bodySmall!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getDisplayLarge(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.displayLarge!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getDisplayMedium(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.displayMedium!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getDisplaySmall(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.displaySmall!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getHeadlineLarge(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.headlineLarge!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getHeadlineMedium(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.headlineMedium!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getHeadlineSmall(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.headlineSmall!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getLabelLarge(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.labelLarge!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getLabelMedium(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.labelMedium!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getLabelSmall(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.labelSmall!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getTitleLarge(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.titleLarge!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getTitleMedium(BuildContext context, {Color? color}) {
  final originalStyle = context.txtTheme.titleMedium!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}

TextStyle getTitleSmall(
  BuildContext context, {
  Color? color,
}) {
  final originalStyle = context.txtTheme.titleSmall!;
  return color != null ? originalStyle.copyWith(color: color) : originalStyle;
}
