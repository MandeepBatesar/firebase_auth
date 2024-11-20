import 'package:firebase_authntication/Model/MsgModel.dart';
import 'package:firebase_authntication/res/Api/Apis.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatController {
  final DatabaseReference _chatCollection = Apis().getchatcollection;

  Future<void> createChat(String id, MsgModel chatData) async {
    try {
      // print("Creating chat with data: $chatData");
      final chatRef = await _chatCollection.child(id).push();
      await chatRef.set(chatData.toMap());
      // print("Chat created successfully with ID: ${chatRef.key}");
    } catch (e) {
      print("Error creating chat: $e");
      rethrow;
    }
  }
}
