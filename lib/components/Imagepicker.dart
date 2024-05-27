import 'dart:io';

import 'package:firebase_authntication/components/appservice.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';


Future<String> getImageFormGallery() async {
  var getImage = await ImagePicker.platform
      .getImageFromSource(source: ImageSource.gallery);
  String imageFile = "";
  if (getImage != null) {
    imageFile = getImage.path;
  }
  return imageFile;
}

Future<String> getImageFormCamra() async {
  var getImage =
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String imageFile = "";
  if (getImage != null) {
    imageFile = getImage.path;
  }
  return imageFile;
}

Future<String> delete_img() async {
  var getImagegallery = await ImagePicker.platform
      .getImageFromSource(source: ImageSource.gallery);
  var getImagecamera =
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String imageFile = "";
  if (getImagegallery != null) {
    imageFile = getImagegallery.path;
  }
  if (getImagecamera != null) {
    imageFile = getImagecamera.path;
  }
  return imageFile;
}

imagePickerbottomsheet(
    BuildContext context, Function(File) file, Function delete) {
  return ClipRect(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: Column(children: [
            Gap(15),
            Text(
              "Image Picker",
        
            ),
            Gap(10),
            ElevatedButton.icon(
                onPressed: () async {
                  File file_path = File(await getImageFormCamra());
                  file(file_path);
                  App_service(context).popTo();
                },
                icon: Icon(Icons.camera),
                label: Text("Camera")),
            ElevatedButton.icon(
                onPressed: () async {
                  File file_path = File(await getImageFormGallery());
                  file(file_path);
                  App_service(context).popTo();
                },
                icon: Icon(Icons.image),
                label: Text("Gallery")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                label: Text("Cancel")),
            ElevatedButton.icon(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete),
                label: Text("delete")),
          ])));
}
