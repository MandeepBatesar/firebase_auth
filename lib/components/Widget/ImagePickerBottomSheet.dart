import 'dart:io';

import 'package:firebase_authntication/Services/AppServices.dart';
import 'package:firebase_authntication/Services/Image.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickBottomsheet extends StatelessWidget {
  String? title;
  Function(File) file;
  ImagePickBottomsheet({super.key, this.title, required this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors().bgclr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_arrow_up_outlined)),
          ),
          heightY(15),
          Text(
            title ?? "",
            style: AppTextTheme().fs16Normal,
          ),
          heightY(15),
          Divider(
            color: AppColors().gray,
          ),
          heightY(15),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormGallery();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImg().gallery),
                        heightY(15),
                        Text(
                          "Gallery",
                          style: AppTextTheme().fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              widthX(30),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormCamera();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImg().camera),
                        heightY(10),
                        Text(
                          "Camera",
                          style: AppTextTheme().fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<String> getImageFormGallery() async {
  final ImagePicker picker = ImagePicker();
  // ignore: invalid_use_of_visible_for_testing_member
  var getImage = await picker.pickImage(source: ImageSource.gallery);
  // .getImageFromSource(source: ImageSource.gallery);

  String image = '';

  if (getImage != null) {
    image = getImage.path;
  }

  return image;
}

// Get Image Camra
Future<String> getImageFormCamera() async {
  var getImage =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String image = '';
  if (getImage != null) {
    image = getImage.path;
  }
  return image;
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  const PrimaryContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width ?? AppServices.screenWidth(context),
      padding: padding ?? EdgeInsets.all(10),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColors().white,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: child,
    );
  }
}
