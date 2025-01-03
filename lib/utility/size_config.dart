import 'package:flutter/material.dart';

class SizeConfig {
  static final SizeConfig _instance = SizeConfig._internal();
  factory SizeConfig() => _instance;
  SizeConfig._internal();

  MediaQueryData? _mediaQueryData;
  double? screenWidth;
  double? screenHeight;
  double? defaultSize;
  Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
  }
}

SizeConfig sizeConfig = SizeConfig();

double getProportionateScreenHeight(double inputHeight) {
  if (sizeConfig.screenHeight == null) return inputHeight;
  double referenceHeight =
      sizeConfig.orientation == Orientation.portrait ? 812 : 375;
  return (inputHeight / referenceHeight) * sizeConfig.screenHeight!;
}

double getProportionateScreenWidth(double inputWidth) {
  if (sizeConfig.screenWidth == null) return inputWidth;
  double referenceWidth =
      sizeConfig.orientation == Orientation.portrait ? 375 : 812;
  return (inputWidth / referenceWidth) * sizeConfig.screenWidth!;
}
