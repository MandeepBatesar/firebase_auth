import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authntication/auth/login_screen.dart';
import 'package:firebase_authntication/components/appservice.dart';
import 'package:firebase_authntication/controller/AuthController.dart';
import 'package:firebase_authntication/home_screen.dart';
import 'package:firebase_authntication/main.dart';
import 'package:firebase_authntication/model/AuthModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final auth = FirebaseAuth.instance;
final storagedata = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

class AuthFunction {
  BuildContext context;
  AuthFunction(this.context);

  //****************** sign up function ****************** */
  Future signupFunction(Authmodel model, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: model.gmail!, password: password);
      if (userCredential.user?.uid != null) {
        await set_user_creatcollaction(model, userCredential.user!.uid);
        preferences.setString("uid", userCredential.user!.uid);
        App_service(context).pushTo(const HomeScreen());
      }
    } catch (e) {
      print(e);
    }
  }

  //****************** create collection ****************** */
  Future<void> set_user_creatcollaction(Authmodel model, String uid) async {
    final provider = Provider.of<Authcontroller>(context, listen: false);
    try {
      await storagedata
          .collection("user")
          .doc(uid)
          .set(model.tojson())
          .then((value) async {
        await provider
            .setuserData(Authmodel.fromAuthmodel(model.tojson(), uid));
      });
    } catch (e) {
      print("=====Error====");
      print(e.toString());
      debugPrint("=====Error====");
    }
  }

  //****************** create collection ****************** */
  // Future<void> get_user_creatcollaction(String uid) async {
  //   final provider = Provider.of<Authcontroller>(context, listen: false);
  //   try {
  //     await storagedata.collection("user").doc(uid).get().then((value) async {
  //       await provider.setuserData(Authmodel.fromAuthmodel(value.data()!, uid));
  //       App_service(context).pushTo(const HomeScreen());
  //     });
  //   } catch (e) {
  //     print("=====Error====");
  //     print(e.toString());
  //     debugPrint("=====Error====");
  //   }
  // }

  //****************** sign in  user ****************** */
  Future signin(String email, String password) async {
    final provider = Provider.of<Authcontroller>(context, listen: false);
    try {
      final checkuser = await storagedata
          .collection("user")
          .where("gmail", isEqualTo: email)
          .get();
      if (checkuser.docs.isNotEmpty) {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then(
          (value) {
            List<Authmodel> userdata = checkuser.docs
                .map((e) => Authmodel.fromAuthmodel(e.data(), e.id))
                .toList();
            provider.setuserData(userdata.first);
            preferences.setString("uid", provider.getuserdata.uid!);
            if (value.user != null) {
              App_service(context).pushTo(const HomeScreen());
            }
          },
        );
      } else {
        print("Please Enter Your Correct Gmail");
      }
    } catch (e) {
      print(e);
    }
  }

  //****************** Relogin for home screen ****************** */
  Future relogin(BuildContext context) async {
    final provider = Provider.of<Authcontroller>(context, listen: false);
    try {
      final sharedUid = preferences.getString("uid") ?? "";
      if (sharedUid.isNotEmpty) {
        final data = await storagedata.collection("user").doc(sharedUid).get();
        //  print(data.id);
        if (data.exists) {
          provider.setuserData(Authmodel.fromAuthmodel(data.data()!, data.id));
          App_service(context).pushTo(HomeScreen());
        } else {
          preferences.remove("user");
          App_service(context).pushTo(LoginScreen());
        }
      } else {
        App_service(context).pushTo(LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}

//****************** update function */
class UpdateData {
  Future updateFunction(BuildContext context, Authmodel model) async {
    try {
      final provider = Provider.of<Authcontroller>(context, listen: false);
      await storagedata
          .collection("user")
          .doc(model.uid)
          .update(model.tojson())
          .then((v) => provider.updateUserProfile(model));
    } catch (e) {
      print(e);
    }
  }
}

//****************** firestorage image function */
class ImagefirebaseFunction {
  Future<String> uploadimg(File file) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString() +
        file.path.split("/").last;
    final storageRef = storage.ref().child("media/$id");
    await storageRef.putFile(file);
    final url = await storageRef.getDownloadURL();
    //  print("Url Image ******************* ${url}");
    return url;
  }

  Future updateimg(File file, String url) async {
    try {
      final storageRef = storage.refFromURL(url);
      await storageRef.putFile(file);
      final downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print(e);
    }
  }

  Future deleteimg(String url) async {
    try {
      final storageRef = storage.refFromURL(url);
      storageRef.delete();
    } catch (e) {
      print(e);
    }
  }
}
