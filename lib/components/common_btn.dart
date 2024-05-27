import 'package:firebase_authntication/components/appservice.dart';
import 'package:flutter/material.dart';

class common_btn extends StatelessWidget {
  Function onpressed;
  String btn_name;

  TextStyle? txtstyle;
  double? width;
  bool isexpendd;
  common_btn(
      {super.key,
      this.isexpendd = false,
      required this.onpressed,
      required this.btn_name,
      this.txtstyle,
      this.width});

  @override
  Widget build(BuildContext context) {
    final isexp = Container(
      width: width ?? App_service(context).getDeviceWidth(),
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(50)),
      child: TextButton(
          style: TextButton.styleFrom(),
          onPressed: () {
            onpressed();
          },
          child: Text(
            btn_name,
          )),
    );
    return isexpendd ? Expanded(child: isexp) : isexp;
  }
}
