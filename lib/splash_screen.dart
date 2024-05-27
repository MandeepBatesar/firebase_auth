import 'package:firebase_authntication/function/AuthFuction.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  initialize() {
    Future.delayed(const Duration(seconds: 5), () {
      AuthFunction(context).relogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Welocme Screen"))],
      )),
    );
  }
}
