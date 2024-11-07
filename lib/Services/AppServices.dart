import 'package:flutter/material.dart';

class AppServices {
  // SCREEN HEIGHT AND WIDTH
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

widthX(double width) {
  return SizedBox(
    width: width,
  );
}

heightY(double height) {
  return SizedBox(
    height: height,
  );
}
