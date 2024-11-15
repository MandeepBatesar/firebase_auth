import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _storage = FirebaseStorage.instance;
final _firestore = FirebaseFirestore.instance;

//**************** */ Uploade profile
Future<String> uploadeprofile(File file) async {
  String id = DateTime.now().microsecondsSinceEpoch.toString() +
      file.path.split("/").last;
  final reference = await _storage.ref().child("profile/$id");
  await reference.putFile(file);
  print("uploaded image :::::::::::::::::::::");
  print("uploaded image :::::::::::::::::::::${reference.getDownloadURL()}");
  return await reference.getDownloadURL();
}

//**************** */ UpDate
Future<String> upDateImage(String url, File file) async {
  final reference = await _storage.refFromURL(url);
  await reference.putFile(file);
  return await reference.getDownloadURL();
}
