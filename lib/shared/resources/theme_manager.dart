import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_valley_task/shared/resources/color_manager.dart';
import 'package:i_valley_task/shared/resources/values_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: ColorManager.color,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    scaffoldBackgroundColor: Colors.white,
    cardTheme:
        const CardTheme(color: ColorManager.white, elevation: AppSize.s1),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: ColorManager.primary),
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          TextStyle(fontSize: FontSize.s20, color: ColorManager.white),
    ),
  );
}
