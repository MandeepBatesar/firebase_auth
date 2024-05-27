import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpanseDetialScreen extends StatelessWidget {
  const ExpanseDetialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Text("Burger King"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/image/burgerkingimg.png",
                scale: 7,
              ),
            ),
            Gap(6),
            Row(
              children: [
                Icon(
                  Icons.paid_sharp,
                  color: Colors.blueAccent,
                ),
                Gap(3),
                Text("Total Amount :"),
                Gap(10),
                Text("300"),
              ],
            ),
            Gap(6),
            Row(
              children: [
                Icon(
                  Icons.wallet,
                  color: Colors.blueAccent,
                ),
                Gap(3),
                Text("Payment Method :"),
                Gap(10),
                Text("UPI"),
              ],
            ),
            Gap(6),
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.blueAccent,
                ),
                Gap(3),
                Text("Date & Time :"),
                Gap(10),
                Text("13 May 10:29PM"),
              ],
            ),
            Gap(6),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.blueAccent,
                ),
                Gap(3),
                Text("Location :"),
                Gap(10),
                Text("Hisar"),
              ],
            ),
            Gap(6),
            Row(
              children: [
                Icon(
                  Icons.note_add,
                  color: Colors.blueAccent,
                ),
                Gap(3),
                Text("Note :"),
                Gap(10),
                Text("Party"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
