// import 'package:authandnotification/Controller/NotesController.dart';
// import 'package:authandnotification/Model/Notes.dart';
// import 'package:authandnotification/Services/AppServices.dart';
// import 'package:authandnotification/components/TextField/PrimaryTextField.dart';
// import 'package:authandnotification/constant/AppTextTheme.dart';
// import 'package:authandnotification/view/ToDoApp/HomeScreen.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddnotesScreen extends StatefulWidget {
//   const AddnotesScreen({super.key});

//   @override
//   State<AddnotesScreen> createState() => _AddnotesScreenState();
// }

// class _AddnotesScreenState extends State<AddnotesScreen> {
//   final _title = TextEditingController();

//   final _subtitle = TextEditingController();

//   final _datefrom = TextEditingController();

//   final notesController = Get.find<NotesController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//           backgroundColor: AppColors().primary,
//           onPressed: () {
//             notesData();
//             Get.off(HomeScreen());
//           },
//           label: Text(
//             "save",
//             style: AppTextTheme().fs16Normal.copyWith(color: AppColors().white),
//           )),
//       appBar: AppBar(
//         // centerTitle: true,

//         // automaticallyImplyLeading: false,
//         foregroundColor: AppColors().white,
//         backgroundColor: AppColors().primary,
//         title: Text(
//           "Notes",
//           style: AppTextTheme().fs20Bold.copyWith(color: AppColors().white),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Primary_txtField(
//             controller: _title,
//             hint_txt: "Enter Your Title",
//             title: "Note Title",
//           ),
//           heightY(16),
//           Datetimetextfield(
//               readOnly: true,
//               controller: _datefrom,
//               hint: "DD/MM/YY",
//               onpressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _datefrom.text = "${pickedDate.toLocal()}".split(' ')[0];
//                   });
//                 }
//               }),
//           heightY(16),
//           TextField(
//             controller: _subtitle,
//             maxLines: 10,
//             decoration: InputDecoration(
//               hintText: "description",
//               filled: true,
//               fillColor: AppColors().white,
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: AppColors().white)),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.white, width: 2),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.white, width: 1),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   notesData() {
//     final modeldata = NotesModel(
//             notestatus: notestate.Progress,
//             createdate: DateTime.now(),
//             expiredate: DateTime.now(),
//             subtitle: _subtitle.text,
//             title: _title.text)
//         .toJson();
//     notesController.addnotes(modeldata);
//   }
// }
