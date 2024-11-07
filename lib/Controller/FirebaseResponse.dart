import 'package:cloud_firestore/cloud_firestore.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  // Function to get data from Firestore
  Future<dynamic> getDataFromFirebase(CollectionReference collection) async {
    try {
      QuerySnapshot snapshot = await collection.get();
      List<Map<String, dynamic>> dataList = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return dataList;
    } catch (e) {
      print("Error fetching data from Firestore: $e");
      return null;
    }
  }
}
