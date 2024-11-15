import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  // final _usercontroller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /************* */
            Expanded(
              child: GetBuilder<UserController>(
                init: UserController()..getAllUsers(),
                builder: (userController) {
                  if (userController.getuserList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: userController.getuserList.length,
                    itemBuilder: (context, index) {
                      final user = userController.getuserList[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: user.image!.isEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.network(
                                user.image!,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                        title: Text(user.name.toString()),
                        subtitle: Text(user.email.toString()),
                      );
                    },
                  );
                },
              ),
            )

            /************* */
          ],
        ),
      )),
    );
  }
}
