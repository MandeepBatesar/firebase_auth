import 'package:firebase_authntication/components/common_btn.dart';
import 'package:firebase_authntication/components/txtfromfield.dart';
import 'package:firebase_authntication/function/AuthFuction.dart';
import 'package:firebase_authntication/model/AuthModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _gmail = TextEditingController();
  final TextEditingController _phnNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            common_txtfield(controller: _name, hint_txt: "name"),
            const Gap(20),
            common_txtfield(controller: _gmail, hint_txt: "Gamil"),
            const Gap(20),
            common_txtfield(controller: _password, hint_txt: "Password"),
            const Gap(20),
            common_txtfield(controller: _phnNumber, hint_txt: "Phone Number"),
            const Gap(20),
            common_txtfield(controller: _address, hint_txt: "Address"),
            const Gap(20),
            common_btn(
                onpressed: () async {
                  await AuthFunction(context).signupFunction(
                      Authmodel().copyWith(
                        gmail: _gmail.text.trim(),
                        address: _address.text,
                        name: _name.text,
                        phn_number: _phnNumber.text,
                      ),
                      _password.text.trim());
                },
                btn_name: "SignUp")
          ],
        ),
      )),
    );
  }
}
