import 'package:firebase_authntication/ExpanceManager/AddExpance.dart';
import 'package:firebase_authntication/components/app_data/appdata.dart';
import 'package:firebase_authntication/components/appservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DeshBoardScreen extends StatelessWidget {
  const DeshBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.black,
        child: Text("data"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          App_service(context).pushTo(TransactionDetailsScreen());
        },
        label: Text(
          "Add Expance",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Expense Manager",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey! Mandeep",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Welcome Bizmitt",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  Gap(10),
                  Container(
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "UnclaimedExpenses",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Flexible(flex: 1, child: Text("2000000")),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "ViewReport",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.blueAccent,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Text("Budget"),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: AppData.BudgetData.length,
                      itemBuilder: (context, index) {
                        final data = AppData.BudgetData;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: new CircularPercentIndicator(
                            radius: 20.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 3.0,
                            percent: 0.4,
                            center: Icon(
                              data[index]["icon"],
                              color: Colors.blueAccent,
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Colors.blueGrey,
                            progressColor: Colors.blueAccent,
                          ),
                          title: Text(
                            data[index]["title"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Text(data[index]["Date"]),
                          trailing: Text(
                            data[index]["price"],
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        );
                      }),
                  Gap(10),
                  // TextButton(
                  //     onPressed: () {
                  //       showModalBottomSheet(
                  //         isScrollControlled: true, enableDrag: true,
                  //         constraints: BoxConstraints.tight(Size(
                  //             MediaQuery.of(context).size.width,
                  //             MediaQuery.of(context).size.height * .7)),
                  //         scrollControlDisabledMaxHeightRatio:
                  //             MediaQuery.of(context).size.height * 1,
                  //         context: context,
                  //         builder: (context) => FilterBottomSheet(),
                  //       );
                  //     },
                  //     child: Text("Filter Data")),
                  Gap(10),
                  Text("Recent Activity"),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.3,
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_outline,
                              ),
                              SlidableAction(
                                onPressed: (contaxt) {},
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Icon(
                                Icons.car_crash,
                                color: const Color.fromARGB(255, 244, 191, 121),
                              ),
                            ),
                            title: Text("Speend Money"),
                            subtitle: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: "Car Fuel",
                                      style:
                                          TextStyle(color: Colors.blueAccent)),
                                  TextSpan(text: " May20,1910")
                                ])),
                            trailing: Text(
                              "-1200",
                              style: TextStyle(color: Colors.red),
                            ),
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
