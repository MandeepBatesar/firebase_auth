import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authntication/Data/BasiceApiService.dart';
import 'package:firebase_authntication/Enum/Enum.dart';

class NetworkApiService extends BasiceApiService {
  final _Auth = FirebaseAuth.instance;
  @override
  Future auth(AuthState state, {Map<String, dynamic>? json}) async {
    print("/***************************");
    String email = "";
    String password = "";
    if (json != null) {
      email = json["email"] ?? "";
      password = json["password"] ?? "";
    }
    if (state == AuthState.SIGNUP) {
      UserCredential userCredential =
          await _Auth.createUserWithEmailAndPassword(
              email: email, password: password);
      print("/***************************");
      print(userCredential.user!.email);
      print("/***************************");
      return userCredential;
    } else if (state == AuthState.LOGIN) {
      UserCredential userCredential = await _Auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } else {
      await _Auth.signOut();
    }
  }

  @override
  Future getdata(path) async {
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await path.get();
      } else if (path is DocumentReference) {
        response = await path.get();
      } else if (path is Query<Map<String, dynamic>>) {
        response = await path.get();
      }
    } catch (e) {
      rethrow;
    }
    return response;
  }

  /// ***************************post******************
  @override
  Future post(path, Map<String, dynamic> data) async {
    if (path is CollectionReference) {
      return await path.add(data);
    } else {
      return await (path as DocumentReference).set(data);
    }
  }

  @override
  Future upDate(path, Map<String, dynamic> data) async {
    if (path is DocumentReference) {
      await path.update(data);
    }
  }

  @override
  Future deleteDate(paht, Map<String, dynamic> data) {
    // TODO: implement deleteDate
    throw UnimplementedError();
  }
}
