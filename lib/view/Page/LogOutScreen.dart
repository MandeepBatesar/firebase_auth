import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:firebase_authntication/components/AppButton/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutScreen extends StatelessWidget {
  LogOutScreen({super.key});
  final usercontroller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: PrimaryButton(
            title: "LogOut",
            onPressed: () {
              usercontroller.logout();
            }),
      )),
    );
  }
}
