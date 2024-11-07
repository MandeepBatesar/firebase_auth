// import 'package:authandnotification/Controller/NotesController.dart';
// import 'package:authandnotification/Model/Notes.dart';
// import 'package:authandnotification/Services/AppServices.dart';
// import 'package:authandnotification/constant/AppTextTheme.dart';
// import 'package:authandnotification/view/ToDoApp/AddnotesScreen.dart';
// import 'package:authandnotification/view/ToDoApp/UpdateScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final _formkey = GlobalKey<FormState>();
//   final notescontroller = Get.find<NotesController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // centerTitle: true,

//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors().primary,
//         title: Text(
//           "Notes",
//           style: AppTextTheme().fs20Bold.copyWith(color: AppColors().white),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors().primary,
//         onPressed: () {
//           Get.to(const AddnotesScreen());
//         },
//         child: Icon(
//           Icons.add,
//           color: AppColors().white,
//         ),
//       ),
//       body: Form(
//         key: _formkey,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 GetBuilder<NotesController>(
//                   builder: (controller) {
//                     return Expanded(
//                       child: ListView.separated(
//                         separatorBuilder: (context, index) => heightY(6),
//                         shrinkWrap: true,
//                         itemCount: controller.getnotes.length,
//                         itemBuilder: (context, index) {
//                           // final note = controller.getnotes[index];
//                           return controller.getnotes.isEmpty
//                               ? const SizedBox()
//                               : Container(
//                                   padding: const EdgeInsets.all(9),
//                                   width: AppServices.screenWidth(context),
//                                   decoration: BoxDecoration(
//                                       color: AppColors().primary,
//                                       borderRadius: BorderRadius.circular(12)),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               controller.getnotes[index].title
//                                                   .toString(),
//                                               style: AppTextTheme()
//                                                   .fs16Normal
//                                                   .copyWith(
//                                                       color: AppColors().white),
//                                             ),
//                                           ),
//                                           PopupMenuButton(
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                 Radius.circular(10.0),
//                                               ),
//                                             ),
//                                             padding: EdgeInsets.zero,
//                                             icon: Container(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 4,
//                                                       horizontal: 4),
//                                               decoration: BoxDecoration(
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                       color: AppColors()
//                                                           .gray
//                                                           .withOpacity(0.2),
//                                                       blurRadius: 1,
//                                                       spreadRadius: 1,
//                                                       offset:
//                                                           const Offset(0, 0))
//                                                 ],
//                                                 shape: BoxShape.circle,
//                                                 color: AppColors().white,
//                                               ),
//                                               child: const Icon(
//                                                 Icons.more_vert,
//                                               ),
//                                             ),
//                                             color: Colors.white,
//                                             itemBuilder:
//                                                 (BuildContext context) {
//                                               return [
//                                                 PopupMenuItem(
//                                                   onTap: () {
//                                                     Get.to(const UpdateScreen(),
//                                                         arguments: {
//                                                           "id": controller
//                                                               .getnotes[index]
//                                                               .id
//                                                         });
//                                                   },
//                                                   value: "Edit",
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       const Text("Edit"),
//                                                       IconButton(
//                                                           onPressed: () {},
//                                                           icon: const Icon(Icons
//                                                               .edit_outlined))
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 PopupMenuItem(
//                                                   onTap: () {
//                                                     notescontroller.deleteNote(
//                                                         controller
//                                                             .getnotes[index].id
//                                                             .toString());
//                                                   },
//                                                   value: "Delete",
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       const Text("Delete"),
//                                                       IconButton(
//                                                         onPressed: () {},
//                                                         icon: Icon(
//                                                           Icons.delete_outline,
//                                                           color:
//                                                               AppColors().red,
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ];
//                                             },
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         controller.getnotes[index].subtitle
//                                             .toString(),
//                                         style: AppTextTheme()
//                                             .fs14Normal
//                                             .copyWith(color: AppColors().white),
//                                       ),
//                                       heightY(6),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 "Due Date",
//                                                 style: AppTextTheme()
//                                                     .fs16Normal
//                                                     .copyWith(
//                                                         color:
//                                                             AppColors().white),
//                                               ),
//                                               Text(
//                                                 DateFormat('dd/MM/yy').format(
//                                                     DateTime.parse(controller
//                                                         .getnotes[index]
//                                                         .expiredate!
//                                                         .toString())),
//                                                 style: AppTextTheme()
//                                                     .fs16Normal
//                                                     .copyWith(
//                                                         color:
//                                                             AppColors().white),
//                                               ),
//                                             ],
//                                           ),
//                                           widthX(6),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               Text(
//                                                 "Created Date",
//                                                 style: AppTextTheme()
//                                                     .fs16Normal
//                                                     .copyWith(
//                                                         color:
//                                                             AppColors().white),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     DateFormat('hh:mm a')
//                                                         .format(DateTime.parse(
//                                                             controller
//                                                                 .getnotes[index]
//                                                                 .createdate!
//                                                                 .toString())),
//                                                     style: AppTextTheme()
//                                                         .fs16Normal
//                                                         .copyWith(
//                                                             color: AppColors()
//                                                                 .white),
//                                                   ),
//                                                   widthX(6),
//                                                   Text(
//                                                     DateFormat('dd/MM/yy')
//                                                         .format(DateTime.parse(
//                                                             controller
//                                                                 .getnotes[index]
//                                                                 .createdate!
//                                                                 .toString())),
//                                                     style: AppTextTheme()
//                                                         .fs16Normal
//                                                         .copyWith(
//                                                             color: AppColors()
//                                                                 .white),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       heightY(10),
//                                       controller.getnotes[index].notestatus ==
//                                               notestate.Complete
//                                           ? Icon(
//                                               Icons.check_circle,
//                                               color: AppColors().green,
//                                             )
//                                           : Icon(
//                                               Icons.check_circle_outline,
//                                               color: AppColors().white,
//                                             ),
//                                     ],
//                                   ));
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
