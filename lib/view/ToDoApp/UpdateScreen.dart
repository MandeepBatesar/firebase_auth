// import 'package:authandnotification/Controller/NotesController.dart';
// import 'package:authandnotification/Model/Notes.dart';
// import 'package:authandnotification/Services/AppServices.dart';
// import 'package:authandnotification/components/TextField/PrimaryTextField.dart';
// import 'package:authandnotification/constant/AppTextTheme.dart';
// import 'package:authandnotification/view/ToDoApp/HomeScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({super.key});

//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }

// class _UpdateScreenState extends State<UpdateScreen> {
//   final _title = TextEditingController();
//   final _subtitle = TextEditingController();
//   final _datefrom = TextEditingController();
//   bool ischecked = false;
//   final id = Get.arguments["id"];

//   @override
//   void initState() {
//     super.initState();
//     _getupdate();
//   }

//   // Fetch the note details and set the initial values for the controllers
//   _getupdate() {
//     final notescontroller = Get.find<NotesController>();
//     final dataId = notescontroller.getnotes
//         .firstWhere((e) => e.id == id, orElse: () => NotesModel());
//     _subtitle.text = dataId.subtitle ?? '';
//     _title.text = dataId.title ?? '';
//     _datefrom.text = dataId.expiredate.toString();
//     ischecked = dataId.notestatus == notestate.Complete;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final notescontroller = Get.find<NotesController>();
//     final dataId = notescontroller.getnotes
//         .firstWhere((e) => e.id == id, orElse: () => NotesModel());

//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: AppColors().primary,
//         onPressed: () {
//           final newStatus = ischecked ? notestate.Complete : notestate.Progress;
//           // Update the note with the new data
//           final adddata = NotesModel(
//             id: id,
//             createdate: dataId.createdate,
//             expiredate: DateTime.tryParse(_datefrom.text),
//             subtitle: _subtitle.text,
//             title: _title.text,
//             notestatus: newStatus,
//           ).toJson();
//           notescontroller.editNote(id, adddata);
//           Get.off(HomeScreen());
//         },
//         label: Text(
//           "Save",
//           style: AppTextTheme().fs16Normal.copyWith(color: AppColors().white),
//         ),
//       ),
//       appBar: AppBar(
//         // automaticallyImplyLeading: false,
//         foregroundColor: AppColors().white,
//         backgroundColor: AppColors().primary,
//         title: Text(
//           "Update Note",
//           style: AppTextTheme().fs20Bold.copyWith(color: AppColors().white),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Align(
//             alignment: Alignment.bottomRight,
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   ischecked = !ischecked;
//                 });
//               },
//               child: ischecked
//                   ? Icon(
//                       Icons.check_circle,
//                       color: AppColors().green,
//                     )
//                   : Icon(
//                       Icons.check_circle_outline_outlined,
//                       color: AppColors().gray,
//                     ),
//             ),
//           ),
//           heightY(16),
//           Primary_txtField(
//             controller: _title,
//             hint_txt: "Enter Your Title```",
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
//               hintText: "Description",
//               filled: true,
//               fillColor: AppColors().white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: AppColors().white),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.white, width: 2),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.white, width: 1),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
