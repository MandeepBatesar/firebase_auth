import 'package:firebase_authntication/Enum/Enum.dart';

abstract class BasiceApiService {
  Future<dynamic> auth(AuthState state, {Map<String, dynamic>? json});
  Future<dynamic> post(path, Map<String, dynamic> data);
  Future<dynamic> getdata(path);
  Future<dynamic> upDate(path, Map<String, dynamic> data);
  Future<dynamic> deleteDate(paht, Map<String, dynamic> data);
}
