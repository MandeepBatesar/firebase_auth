import 'package:firebase_authntication/ExpanceManager/AddExpance.dart';
import 'package:firebase_authntication/components/app_data/appdata.dart';
import 'package:flutter/material.dart';

class SubmitExpenseScreen extends StatelessWidget {
  const SubmitExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            shrinkWrap: true,
            itemCount: AppData.expensedata.length,
            itemBuilder: (context, index) {
              var data = AppData.expensedata[index];
              return MyListTile(
                delete_onpressed: () {},
                edit_onpressed: () {},
                Amount: data["Amount"],
                CategoryData: data["Category"],
                DataTime: data["DataTime"],
                Note: data["Note"],
                Paymentmethod: data["Paymentmethod"],
                SubCategoryData: data["SubCategory"],
              );
            },
          ),
        ],
      ),
    );
  }
}
