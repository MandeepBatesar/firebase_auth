import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authntication/Data/NetworkApiService.dart';
import 'package:firebase_authntication/Enum/Enum.dart';
import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:firebase_authntication/main.dart';
import 'package:firebase_authntication/res/Api/Apis.dart';
import 'package:firebase_authntication/view/Auth/LoginScreen.dart';
import 'package:firebase_authntication/view/BottomBar/BottomNavigationBar.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _services = NetworkApiService();
  dynamic _userdata;
  Usermodel get getuserdata => _userdata;

  // List to store all users
  List<Usermodel> _userList = [];
  List<Usermodel> get getuserList => _userList;

  /// **************************
  setUserData(Usermodel model) {
    _userdata = model;
    update();
  }

  /// Fetch all users from Firestore and update _userList
  Future<void> getAllUsers() async {
    try {
      final snapshot = await Apis().getusercolllection.get();
      _userList = snapshot.docs.map((doc) {
        return Usermodel.fromJson(doc.data());
      }).toList();
      update();
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  /// ***************************** Real-time update of user profile
  final String _userProfile = "";
  String get userProfile => _userProfile;

  updateUserProfile(Usermodel model) {
    _userdata = model;
    update();
  }

  /// ***************************** Sign up
  Future<void> signup(Map<String, dynamic> data) async {
    final Usermodel userdata = Usermodel.fromJson(data["userdata"]);
    try {
      final credential = await _services.auth(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;

      final String userid = credential.user!.uid;
      if (userid.isNotEmpty) {
        await _services.post(
            Apis().userdoc(userid), userdata.copyWith(id: userid).tomap());
        _userdata = userdata.copyWith(id: userid);
        prefrance.setUserPrefs(userdata);
        prefrance.setUserId(userid);
        Get.offAll(BottomnavigationbarScreen());
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  /// ************************ Login
  Future<void> login(String email, String password) async {
    try {
      final snapshot = await _services.getdata(
              Apis().getusercolllection.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;

      if (snapshot.docs.isNotEmpty) {
        await _services.auth(AuthState.LOGIN,
            json: {"email": email, "password": password}) as UserCredential;

        final Usermodel usermodelData =
            Usermodel.fromJson(snapshot.docs.first.data());
        _userdata = usermodelData;
        prefrance.setUserPrefs(usermodelData);
        prefrance.setUserId(usermodelData.id);
        Get.offAll(BottomnavigationbarScreen());
      }
    } catch (e) {
      print("Login error: $e");
    }
  }

  /// ************************ Logout
  Future<void> logout() async {
    try {
      await _services.auth(AuthState.LOGOUT);
      prefrance.removePrefs(prefrance.userkey);
      prefrance.removePrefs(prefrance.userIdKey);
      Get.offAll(const LoginScreen());
      print("Logged out successfully");
    } catch (e) {
      print("Logout error: $e");
    }
  }

  /// ************************ Relogin
  Future<void> relogin() async {
    try {
      final String userId = prefrance.getstring(prefrance.userkey);
      if (userId.isNotEmpty) {
        final data = await Apis().userdoc(jsonDecode(userId)["id"]).get();
        if (data.exists) {
          final Usermodel usermodelData = Usermodel.fromJson(data.data()!);
          _userdata = usermodelData;
          prefrance.setUserPrefs(usermodelData);
          prefrance.setUserId(usermodelData.id);
          Get.offAll(BottomnavigationbarScreen());
        } else {
          Get.offAll(const LoginScreen());
        }
      } else {
        Get.offAll(const LoginScreen());
      }
    } catch (e) {
      print("Relogin error: $e");
      Get.offAll(const LoginScreen());
    } finally {
      update();
    }
  }

  /// ************************ Update user
  Future<void> updateUser(Usermodel model) async {
    try {
      await Apis().userdoc(getuserdata.id).update(model.tomap()).then((value) {
        updateUserProfile(model);
      });
    } catch (e) {
      print("User update error: $e");
    }
  }
}
