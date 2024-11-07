import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authntication/Data/NetworkApiService.dart';
import 'package:firebase_authntication/Enum/Enum.dart';
import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:firebase_authntication/main.dart';
import 'package:firebase_authntication/res/Api/Apis.dart';
import 'package:firebase_authntication/view/Auth/LoginScreen.dart';
import 'package:firebase_authntication/view/Page/ChatView.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _services = NetworkApiService();
  dynamic _userdata;
  Usermodel get userdata => _userdata;

  /// **************************
  setuserdata(Usermodel model) {
    _userdata = model;
    update();
  }

  /**************************** */
  /* ********************* for userupdate in realtime show */
  final String _userProfile = "";
  String get userProfile => _userProfile;
  updateUserProfile(Usermodel model) {
    _userdata = model;
    update();
  }

  /// ***************************** sign up
  Future<void> signup(Map<String, dynamic> data) async {
    final Usermodel userdata = Usermodel.fromjson(data["userdata"]);
    print("--------------------1");
    try {
      final credential = await _services.auth(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      print("--------------------2");
      final String userid = credential.user!.uid;
      if (userid.isNotEmpty) {
        await _services.post(
            Apis().userdoc(userid), userdata.copyWith(id: userid).tomap());
        _userdata = userdata.copyWith(id: userid);
        prefrance.setUserPrefs(userdata);
        Get.offAll(const ChatView());
      }
    } catch (e) {
      // DataResponse.error(e.toString());
      print(e);
    } finally {
      update();
    }
  }

  /// ************************ login
  Future<void> login(String email, String password) async {
    try {
      final snapshot = await _services.getdata(
              Apis().getusercolllection.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;
      if (snapshot.docs.isNotEmpty) {
        await _services.auth(AuthState.LOGIN,
            json: {"email": email, "password": password}) as UserCredential;
        final Usermodel usermodeldata =
            Usermodel.fromjson(snapshot.docs.first.data());
        _userdata = usermodeldata;
        prefrance.setUserPrefs(usermodeldata);
        Get.offAll(const ChatView());
      }
    } catch (e) {
      // _userdata = DataResponse.error(e.toString());
      print("-------login error::: $e-------");
    }
  }

  /// ************************ logout
  Future<void> logout() async {
    try {
      await _services.auth(AuthState.LOGOUT);
      prefrance.removePrefs(prefrance.userkey);
      Get.offAll(const LoginScreen());
    } catch (e) {
      print("=====================");
      print(e.toString());
      print("=====================");
    }
  }

  /// ************************ relogin
  Future<void> relogin() async {
    print("****************************");
    try {
      final String userId = prefrance.getstring(prefrance.userkey);
      if (userId.isNotEmpty) {
        final data = await Apis().userdoc(jsonDecode(userId)["id"]).get();
        if (data.exists) {
          final Usermodel usermodeldata = Usermodel.fromjson(data.data()!);
          _userdata = usermodeldata;
          prefrance.setUserPrefs(usermodeldata);
          Get.offAll(const ChatView());
        } else {
          Get.offAll(const LoginScreen());
        }
      } else {
        Get.offAll(const LoginScreen());
      }
    } catch (e) {
      print("---------relogin error:: $e-------");
      Get.offAll(const LoginScreen());
    } finally {
      update();
    }
  }

  /// ***********************************update**************************************************

  user_update(Usermodel model) {
    try {
      // print("user upload Function run ************");
      // print("step:-1.======================");
      Apis().userdoc(userdata.id).update(model.tomap()).then(
        (value) {
          /************************ for userupdate in realtime show  */
          // print("step:-2.======================");
          updateUserProfile(model);
        },
      );
      // print("step:-3.======================");
    } catch (e) {
      print(e.toString());
    }
  }
}
