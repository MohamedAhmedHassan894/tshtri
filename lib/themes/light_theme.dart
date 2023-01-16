import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_palette.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: AppPalette.primaryColor, //done
  scaffoldBackgroundColor: AppPalette.whiteColor, //done
  appBarTheme: AppBarTheme(
    backgroundColor: AppPalette.whiteColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppPalette.primaryColor,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppPalette.primaryColor,
    ),
    titleTextStyle: AppTextStyles.montserratBold.copyWith(
      fontSize: Dimensions.fontSizeExtraLarge,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
  ),
  disabledColor: const Color(0xFFBABFC4),
  backgroundColor: AppPalette.whiteColor, //done
  brightness: Brightness.light,
  hintColor: const Color(0xFF6D6D6D), //done
  iconTheme: const IconThemeData(color: AppPalette.secondaryColor),
  cardColor: AppPalette.cardColor, //done
  colorScheme: const ColorScheme.light(
    primary: AppPalette.primaryColor,
    secondary: AppPalette.secondaryColor,
  ), //done
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: AppPalette.primaryColor,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeExtraExtraLarge,
              vertical: Dimensions.paddingSizeSmall),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          ),
          textStyle: AppTextStyles.montserratRegular.copyWith(
              fontSize: Dimensions.fontSizeLarge, color: Colors.white))), //done
);
