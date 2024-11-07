import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  final _Database = FirebaseFirestore.instance;

  /// ***** user collection
  CollectionReference<Map<String, dynamic>> get getusercolllection =>
      _Database.collection("user");

  /// ***** doc collection
  CollectionReference<Map<String, dynamic>> get getNotescolllection =>
      _Database.collection("Notes");

  /// ********* user doc
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      getusercolllection.doc(id);

  /// ********* doc doc
  DocumentReference<Map<String, dynamic>> notesdoc(String? id) =>
      getNotescolllection.doc(id);
}
