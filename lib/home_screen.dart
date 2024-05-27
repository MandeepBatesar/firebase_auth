import 'dart:io';

import 'package:firebase_authntication/components/Imagepicker.dart';
import 'package:firebase_authntication/components/appservice.dart';
import 'package:firebase_authntication/components/common_btn.dart';
import 'package:firebase_authntication/components/txtfromfield.dart';
import 'package:firebase_authntication/controller/AuthController.dart';
import 'package:firebase_authntication/function/AuthFuction.dart';
import 'package:firebase_authntication/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _name = TextEditingController();
  // File
  File? imageFile;
  File? bottomsheeetfile;
  String image = "";
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Authcontroller>(context);
    // print(provider.getuserdata.uid);
    // print("${preferences.getString("uid")}-==-====================");
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("data"),
            const Gap(20),
            common_txtfield(controller: _name, hint_txt: "hint_txt"),
            const Gap(20),
            common_btn(
                onpressed: () {
                  UpdateData().updateFunction(
                      context, provider.getuserdata.copyWith(name: _name.text));
                },
                btn_name: "update data"),
            const Gap(20),
            common_btn(
                onpressed: () {
                  preferences.remove("uid");
                },
                btn_name: "LogOut"),
            const Gap(20),
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imageFile == null
                          ? (image.isEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 90,
                                  ))
                              : Image.network(
                                  image,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ))
                          : Image.file(
                              File(imageFile!.path),
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            )),
                  Positioned(
                    bottom: 3,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                imagePickerbottomsheet(context, (v) {
                                  if (v.path.isNotEmpty) {
                                    setState(() {
                                      imageFile = v;
                                    });
                                  } else {
                                    null;
                                  }
                                }, () {
                                  App_service(context).popTo();
                                  setState(() {
                                    imageFile = null;
                                  });
                                }));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            common_btn(
                onpressed: () async {
                  if (imageFile != null) {
                    if (image.isEmpty) {
                      image =
                          await ImagefirebaseFunction().uploadimg(imageFile!);
                      //  ImagefirebaseFunction().deleteimg(image);
                    } else {
                      image = await ImagefirebaseFunction()
                          .updateimg(imageFile!, image);
                    }
                  }
                  //   print("-=-=-/$image/-=-=-=-=-=-=-=-=");

                  await UpdateData().updateFunction(
                      context,
                      provider.getuserdata
                          .copyWith(img: image, name: _name.text));
                },
                btn_name: "Upload Img")
          ],
        ),
      )),
    );
  }
}
