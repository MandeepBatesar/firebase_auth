import 'package:firebase_authntication/model/AuthModel.dart';
import 'package:flutter/foundation.dart';

class Authcontroller extends ChangeNotifier {
  dynamic _user;
  Authmodel get getuserdata => _user;
  setuserData(Authmodel model) {
    _user = model;
    notifyListeners();
  }

  String _userProfile = "";
  String get userProfile => _userProfile;
  updateUserProfile(Authmodel model) {
    _user = model;
    notifyListeners();
  }
}
