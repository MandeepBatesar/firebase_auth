import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:firebase_authntication/Services/AppServices.dart';
import 'package:firebase_authntication/components/AppButton/PrimaryButton.dart';
import 'package:firebase_authntication/components/TextField/PrimaryTextField.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:firebase_authntication/view/Auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool isvisibility = true;

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightY(40),
                Text(
                  "Create An Account",
                  style: AppTextTheme().fs20Bold,
                ),
                heightY(6),
                Text(
                  "Welcome! Please enter your details.",
                  style: AppTextTheme()
                      .fs16Normal
                      .copyWith(color: AppColors().gray),
                ),
                Primary_txtField(
                  controller: _name,
                  hint_txt: "Enter Your Names",
                  title: "Name",
                ),
                heightY(9),
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
                        title: "SignUp",
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
                        Get.to(const LoginScreen());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const LoginScreen(),
                        // ));
                      },
                      child: Text(
                        "Login",
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
      ),
    ));
  }

  valideinput() {
    if (_formkey.currentState!.validate()) {
      final modeldata =
          Usermodel(name: _name.text.trim(), email: _email.text.trim());
      UserController().signup(
          {"userdata": modeldata.tomap(), "password": _password.text.trim()});
    }
  }
}
