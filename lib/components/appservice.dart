import 'package:flutter/material.dart';

class App_service {
  BuildContext context;
  App_service(this.context);
  // Non_static Methods
  pushTo(Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  pushAndRemoveUntil(Widget screen) => Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen), (route) => false);

  popTo() => Navigator.of(context).pop();

  getDeviceWidth() => MediaQuery.of(context).size.width;
  getDeviceheight() => MediaQuery.of(context).size.height;
}
