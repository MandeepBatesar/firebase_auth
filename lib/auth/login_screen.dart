import 'package:firebase_authntication/auth/signup_screen.dart';
import 'package:firebase_authntication/components/appservice.dart';
import 'package:firebase_authntication/components/common_btn.dart';
import 'package:firebase_authntication/components/txtfromfield.dart';
import 'package:firebase_authntication/function/AuthFuction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _gmail = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final porvider = Provider.of<Authcontroller>(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              common_txtfield(controller: _gmail, hint_txt: "Gamil"),
              Gap(20),
              common_txtfield(controller: _password, hint_txt: "Password"),
              Gap(20),
              common_btn(
                  onpressed: () {
                    if (_formkey.currentState!.validate()) {
                      AuthFunction(context)
                          .signin(_gmail.text.trim(), _password.text.trim());
                    }
                  },
                  btn_name: "Login"),
              Gap(20),
              common_btn(
                  onpressed: () {
                    App_service(context).pushTo(SignUpScreen());
                  },
                  btn_name: "SignUp"),
            ],
          ),
        )),
      ),
    );
  }
}
