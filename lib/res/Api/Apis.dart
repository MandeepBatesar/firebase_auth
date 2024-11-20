import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Apis {
  final _Database = FirebaseFirestore.instance;
  final _realtime = FirebaseDatabase.instance;

  /// ***** user collection
  CollectionReference<Map<String, dynamic>> get getusercolllection =>
      _Database.collection("user");

/************************ chat collection*/
  DatabaseReference get getchatcollection => _realtime.ref().child("chat");

  /// ***** doc collection
  CollectionReference<Map<String, dynamic>> get getNotescolllection =>
      _Database.collection("Notes");

  /// ********* user doc
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      getusercolllection.doc(id);
  /********************* */
  DatabaseReference chatidcollection(String? id) => getchatcollection.child(id!);

  /// ********* doc doc
  DocumentReference<Map<String, dynamic>> notesdoc(String? id) =>
      getNotescolllection.doc(id);
}
