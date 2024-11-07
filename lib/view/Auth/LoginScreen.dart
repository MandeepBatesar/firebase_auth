import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:firebase_authntication/Services/AppServices.dart';
import 'package:firebase_authntication/components/AppButton/PrimaryButton.dart';
import 'package:firebase_authntication/components/TextField/PrimaryTextField.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:firebase_authntication/view/Auth/SignUpScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isvisibility = true;

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formkey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightY(40),
              Text(
                "Log in",
                style: AppTextTheme().fs20Bold,
              ),
              heightY(6),
              Text(
                "Welcome Back! Please enter your details.",
                style:
                    AppTextTheme().fs16Normal.copyWith(color: AppColors().gray),
              ),
              Primary_txtField(
                controller: _email,
                hint_txt: "Enter Your Email",
                title: "Email",
              ),
              heightY(9),
              Primary_txtField(
                controller: _password,
                hint_txt: "*********",
                suffixicon: isvisibility
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                obscuretxt: isvisibility,
                suffix_onpressed: () {
                  setState(() {
                    isvisibility = !isvisibility;
                  });
                },
                title: "Password",
              ),
              heightY(40),
              Row(
                children: [
                  PrimaryButton(
                      title: "Login",
                      isExpanded: true,
                      onPressed: () {
                        valideinput();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const HomeScreen(),
                        // ));
                      }),
                ],
              ),
              heightY(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextTheme().fs16Normal,
                  ),
                  widthX(6),
                  InkWell(
                    onTap: () {
                      // Get.to(const SignUpScreen());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: Text(
                      "SignUp",
                      style: AppTextTheme()
                          .fs16Normal
                          .copyWith(color: AppColors().blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  valideinput() {
    if (_formkey.currentState!.validate()) {
      UserController().login(_email.text.trim(), _password.text.trim());
    }
  }
}
