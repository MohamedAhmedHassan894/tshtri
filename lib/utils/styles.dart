import 'package:flutter/material.dart';
import 'app_palette.dart';
import 'dimensions.dart';

class Fonts {
  static const String montserrat = "Montserrat";
}

class AppTextStyles {
  //montserrat
  static final TextStyle montserratLight = TextStyle(
    color: AppPalette.primaryColor,
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.fontSizeDefault,
  );
  static final TextStyle montserratRegular = TextStyle(
    color: AppPalette.primaryColor,
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeDefault,
  );

  static final TextStyle montserratMedium = TextStyle(
    color: AppPalette.primaryColor,
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeDefault,
  );
  static final TextStyle montserratBold = TextStyle(
    color: AppPalette.primaryColor,
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w700,
    fontSize: Dimensions.fontSizeDefault,
  );
}
