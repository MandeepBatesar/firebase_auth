import 'dart:math' as math;

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_authntication/Controller/chatcontroller.dart';
import 'package:firebase_authntication/Model/MsgModel.dart';
import 'package:firebase_authntication/Model/UserModel.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:firebase_authntication/main.dart';
import 'package:firebase_authntication/res/Api/Apis.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatDetailScreen extends StatefulWidget {
  final Usermodel model;
  ChatDetailScreen({super.key, required this.model});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _massagecontroller = TextEditingController();
  // List<MsgModel> mylist = [];
  bool isemojishow = false;
  FocusNode _focusNode = FocusNode();
  int checkValue = 0;
  emojiSelected() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        // print(emoji);
        setState(() {
          _massagecontroller.text = _massagecontroller.text + emoji.emoji;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isemojishow = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String userId = prefrance.getstring(prefrance.userIdKey);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
            widget.model.image!.isEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      widget.model.image!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
          ],
        ),
        title: Text(widget.model.name.toString()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  query: Apis()
                      .chatidcollection("${"${widget.model.id}_" + userId}"),
                  itemBuilder: (context, snapshot, _, index) {
                    final keys = snapshot.key;
                    // final data = Map<String, dynamic>.from(
                    //     snapshot.value as Map<Object?, Object?>);
                    // final msgModel = MsgModel.frommsgmodel(data);
                    final data = snapshot.value as Map<Object?, Object?>;
                    final msgData = Map<String, dynamic>.from(data);
                    bool isMe = msgData["sender"] == userId;
                    return MessageContain(
                      isMe: isMe,
                      message: data["txt"].toString(),
                      time: DateFormat('hh:mm a').format(DateTime.now()),
                      onPress: () async {
                        await Apis()
                            .chatidcollection(
                                "${widget.model.id + userId}/$keys")
                            .remove();
                      },
                      index: index,
                      listLength: snapshot.children.length,
                      isSeen: false,
                      type: "",
                    );
                  },
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       final String userId =
              //           prefrance.getstring(prefrance.userIdKey);
              //       print("-------------------//${userId}//------");
              //     },
              //     child: Text("data")),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (v) {
                        setState(() {
                          checkValue = v.length;
                        });
                      },
                      focusNode: _focusNode,
                      controller: _massagecontroller,
                      maxLines: 6,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        hintText: "Message",
                        prefixIcon: IconButton(
                            onPressed: () {
                              if (isemojishow) {
                                _focusNode.unfocus();
                              } else {
                                _focusNode.requestFocus();
                              }
                              setState(() {
                                isemojishow = !isemojishow;
                              });
                            },
                            icon: Icon(Icons.emoji_emotions,
                                color: AppColors().yellow)),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Transform.rotate(
                              angle: -math.pi / 4,
                              child: Icon(Icons.attach_file),
                            )),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      MsgModel model = MsgModel(
                          txt: _massagecontroller.text.trim(),
                          createdon: DateTime.now(),
                          sender: widget.model.id);
                      if (_massagecontroller.text.trim().isNotEmpty) {
                        await ChatController().createChat(
                            "${"${widget.model.id}_" + userId}", model);
                        _massagecontroller.clear();
                        // setState(() {
                        //   mylist.add(
                        //     MsgModel(
                        //       txt: _massagecontroller.text.trim(),
                        //       sender: "me",
                        //       createdon: DateTime.now(),
                        //       seen: false,
                        //     ),
                        //   );
                        // });
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // isemojishow ? emojiSelected() : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageContain extends StatelessWidget {
  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  final int index;
  final int listLength;
  final bool isSeen;

  MessageContain({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
        // Get.dialog(AlertDialog(
        //   title: Text("Are You Sure"),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isMe ? Colors.green[100] : Colors.grey[300],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 10, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
