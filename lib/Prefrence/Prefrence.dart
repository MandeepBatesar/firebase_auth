import 'dart:convert';

import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late SharedPreferences _prefs;
  Prefs._init();
  static Prefs get instance => Prefs._init();
  setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // static get _languageKey => "Language";
  get userkey => "userkey";
  get userIdKey => "id";
  // setLanguage({required LanguageModel data}) {
  //   _prefs.setString(_languageKey, data.tojson());
  // }

  // LanguageModel getLanguage() {
  //   return LanguageModel.fromjson(json: _prefs.getString(_languageKey) ?? "");
  // }

  setUserPrefs(Usermodel model) async {
    return await _prefs.setString(userkey, jsonEncode(model.tomap()));
  }

  // Save user ID to SharedPreferences
  setUserId(String id) async {
    return await _prefs.setString(userIdKey, id);
  }

  // Retrieve user ID from SharedPreferences
  String? getUserId() {
    return _prefs.getString(userIdKey);
  }

  Usermodel getUserPrefs() {
    return Usermodel.fromJson(jsonDecode(_prefs.getString(userkey).toString()));
  }

  removePrefs(String userkey) async {
    return await _prefs.remove(userkey);
  }

  getstring(String userkey) {
    return _prefs.getString(userkey) ?? "";
  }
}
