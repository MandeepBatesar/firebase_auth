import 'package:firebase_authntication/ExpanceManager/SubmitExpense%20.dart';
import 'package:firebase_authntication/components/app_data/appdata.dart';
import 'package:firebase_authntication/components/appservice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppbar("Transaction Details"),
      appBar: AppBar(
        leadingWidth: 20,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: Text("Transaction Details"),
        actions: [
          InkWell(onTap: () {}, child: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            shrinkWrap: true,
            itemCount: AppData.expensedata.length,
            itemBuilder: (context, index) {
              var data = AppData.expensedata[index];
              return MyListTile(
                delete_onpressed: () {
                  App_service(context).pushTo(SubmitExpenseScreen());
                },
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

// ignore: must_be_immutable
class MyListTile extends StatefulWidget {
  String CategoryData, SubCategoryData, DataTime, Paymentmethod, Note, Amount;
  final Function edit_onpressed, delete_onpressed;
  MyListTile(
      {super.key,
      required this.Amount,
      required this.CategoryData,
      required this.DataTime,
      required this.Note,
      required this.Paymentmethod,
      required this.SubCategoryData,
      required this.delete_onpressed,
      required this.edit_onpressed});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool isactiveNote = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.3,
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Delete Expense
                      widget.delete_onpressed();
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outline,
                    //   label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      widget.edit_onpressed();
                      // push on Add Expanse Screen for editing
                    },
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    // label: 'Edit',
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 244, 191, 121).withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.fastfood_outlined,
                    color: Color.fromARGB(255, 244, 191, 121),
                  ),
                ),
                title: Text(
                  widget.CategoryData,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.SubCategoryData,
                      style: TextStyle(color: Colors.grey),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: widget.DataTime,
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                          text: isactiveNote ? " Hide text" : " Show more",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                isactiveNote = !isactiveNote;
                              });
                            })
                    ]))
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.Amount,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Gap(3),
                    Text(
                      widget.Paymentmethod,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Visibility(
                  visible: isactiveNote,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 239, 240),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Note",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Gap(3),
                        Text(widget.Note)
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
