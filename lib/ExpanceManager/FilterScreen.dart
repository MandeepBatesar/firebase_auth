import 'package:firebase_authntication/components/app_data/appdata.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterBottomSheet extends StatefulWidget {
  FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // final font = GetTextTheme();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: 35,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category Filters",
                  // style: font.fs12_regular,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      for (var category in AppData.filtercategory) {
                        category["bool"] = false;
                      }
                    });
                  },
                  child: Text(
                    "Clear Filter",
                    //   style: font.fs12_regular,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: AppData.filtercategory.length,
              itemBuilder: (context, i) {
                var Appdata = AppData.filtercategory[i];
                return CheckboxListTile.adaptive(
                  autofocus: false,
                  activeColor: Colors.blueAccent,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    Appdata["title"],
                  ),
                  value: Appdata["bool"],
                  onChanged: (value) => setState(() {
                    Appdata["bool"] = value!;
                  }),
                );
              },
            ),
            Gap(10),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: Text("Apply Filters")),
            )
          ],
        ),
      ),
    );
  }
}
