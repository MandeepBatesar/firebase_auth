import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Get.to(const ChatDetailScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://picsum.photos/id/237/200/300",
                        height: 50,
                        width: 48,
                        fit: BoxFit.cover,
                      )),
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Mandeep"), Text("Yesturday")],
                  ),
                  subtitle: const Text("Hlo sir"),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
