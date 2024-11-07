import 'package:firebase_authntication/Controller/NotesController.dart';
import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalldata();
    _splash();
  }

  getalldata() async {
    // await Get.find<NotesController>().getNotes();
    // print("${NotesController().getnotes.length}---------------");
  }

  _splash() {
    Future.delayed(const Duration(seconds: 4), () async {
      // Get.to(HomeScreen());
      await Get.find<UserController>().relogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Welcome Over App")),
    );
  }
}
