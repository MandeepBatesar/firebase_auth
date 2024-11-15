import 'dart:io';

import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:firebase_authntication/Function/ImgFunction.dart';
import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:firebase_authntication/Services/AppServices.dart';
import 'package:firebase_authntication/components/AppButton/PrimaryButton.dart';
import 'package:firebase_authntication/components/Widget/ImagePickerBottomSheet.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

File? imageFile;
String image = "";
final _usercontroller = Get.find<UserController>();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors().bgclr,
      //   title: Text(
      //     "Profile",
      //     style: AppTextTheme().fs16Normal,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imageFile == null
                          ? (image.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: AppColors().gray,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors().white,
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
                      onTap: () async {
                        await showModalBottomSheet(
                            clipBehavior: Clip.antiAlias,
                            context: context,
                            builder: (context) => ImagePickBottomsheet(
                                  file: (v) {
                                    if (v.path.isNotEmpty) {
                                      setState(() {
                                        imageFile = v;
                                      });
                                    } else {
                                      null;
                                    }
                                  },
                                ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors().primary, shape: BoxShape.circle),
                        child: Icon(
                          Icons.edit,
                          color: AppColors().bgclr,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightY(20),
            Row(
              children: [
                PrimaryButton(
                    title: "title",
                    isExpanded: true,
                    onPressed: () async {
                      Usermodel model = _usercontroller.getuserList.first
                          .copyWith(image: image);
                      if (imageFile != null) {
                        if (image.isEmpty) {
                          image = await uploadeprofile(imageFile!);
                          //  print("Profil imag ;::::::: ${image}");
                        } else {
                          image = await upDateImage(image, imageFile!);
                        }
                      }
                      _usercontroller.updateUser(model);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
