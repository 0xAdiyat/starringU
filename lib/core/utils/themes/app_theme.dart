import 'package:flutter/material.dart';

import '../constants/resources/app_colors.manager.constants.dart';
import '../constants/resources/app_styles.manager.constants.dart';
import '../constants/resources/app_values.manager.constants.dart';
import 'app_colors_extension.dart';

class AppTheme {
  static final _lightAppColors = AppColorsExtension(
    primary: ColorManager.colorPrimaryLight,
    onPrimary: ColorManager.colorWhite,
    secondary: ColorManager.colorSecondaryLight,
    onSecondary: ColorManager.colorBlack,
    error: ColorManager.colorError,
    onError: ColorManager.colorWhite,
    background: ColorManager.colorBackgroundLight,
    onBackground: ColorManager.colorBlack,
    surface: ColorManager.colorWhite,
    onSurface: ColorManager.colorBlack,
  );
  static final lightTheme = ThemeData.light().copyWith(
      primaryColor: ColorManager.colorPrimaryLight,
      cardColor: ColorManager.colorCardLight,
      scaffoldBackgroundColor: ColorManager.colorBackgroundLight,
      disabledColor: ColorManager.colorGrey1,
      splashColor: ColorManager.colorSplash,

      // Text color
      primaryColorLight: ColorManager.colorFontPrimaryLight,
      primaryColorDark: ColorManager.colorFontSecondaryLight,
      hintColor: ColorManager.colorPlaceHolderLight,
      shadowColor: ColorManager.colorBackgroundDark,

      // fontFamily: FontConstants.fontDMSans,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.colorBackgroundLight,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.colorPrimaryLight,
        unselectedItemColor: ColorManager.colorBlack,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: ColorManager.colorFontPrimaryLight, size: AppSize.s20),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.colorTextFieldLight,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p20),
          // hint style
          hintStyle: getRegularStyle(color: ColorManager.colorPlaceHolderLight),
          labelStyle: getMediumStyle(color: ColorManager.colorFontPrimaryLight),
          errorStyle: getRegularStyle(color: ColorManager.colorError),
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.transparent, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s10))),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.colorError, width: AppSize.s1_5),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s10))),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.colorPrimaryLight, width: AppSize.s1_5),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s10)))),
      extensions: [
        _lightAppColors,
      ]);

  static final _darkAppColors = AppColorsExtension(
    primary: ColorManager.colorPrimaryDark,
    onPrimary: ColorManager.colorBlack,
    secondary: ColorManager.colorSecondaryDark,
    onSecondary: ColorManager.colorBlack,
    error: ColorManager.colorError,
    onError: ColorManager.colorBlack,
    background: ColorManager.colorBackgroundDark,
    onBackground: ColorManager.colorWhite,
    surface: ColorManager.colorBlack,
    onSurface: ColorManager.colorWhite,
  );

  static final darkTheme =
      ThemeData.dark().copyWith(extensions: [_darkAppColors]);
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}
