// import 'package:authandnotification/Controller/FirebaseResponse.dart';
// import 'package:authandnotification/Model/Notes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class NotesController extends GetxController {
//   final _database = FirebaseFirestore.instance;
//   final _function = FirebaseResponseHandler();
//   List<NotesModel> _noteslist = [];
//   List<NotesModel> get getnotes => _noteslist;

//   /// *******
//   updatefun(NotesModel model) {
//     _noteslist.add(model);
//     update();
//   }

//   // /// Fetch existing notes from Firestore
//   // Future<void> fetchNotes() async {
//   //   try {
//   //     QuerySnapshot querySnapshot = await _database.collection("notes").get();
//   //     _noteslist = querySnapshot.docs
//   //         .map((doc) => NotesModel.fromJson(doc.data() as Map<String, dynamic>))
//   //         .toList();
//   //     update(); // Update GetX state
//   //   } catch (e) {
//   //     print("Error fetching notes: ${e.toString()}");
//   //   }
//   // }

//   Future<String?> addnotes(Map<String, dynamic> model) async {
//     try {
//       String noteId = model["id"] ?? _database.collection("notes").doc().id;
//       DocumentReference docRef = _database.collection("notes").doc(noteId);
//       model["id"] = noteId;
//       await docRef.set(model); // Save the data to Firestore
//       NotesModel newNote = NotesModel.fromJson(model).copyWith(id: noteId);

//       updatefun(newNote);
//       print("=========${getnotes.map((e) => e.id)}---------");
//       Get.snackbar("Add Notes", "Your Data Added Successfully");
//       //  the document ID of the new note
//       return noteId;
//     } catch (e) {
//       print("Error adding note: ${e.toString()}");
//       return null;
//     } finally {
//       update();
//     }
//   }

//   /// ************* get data from firebase
//   // Function to get notes from Firestore
//   Future<void> getNotes() async {
//     print("*********************");
//     try {
//       print("/*******************1");
//       final response =
//           await _function.getDataFromFirebase(_database.collection("notes"));
//       print(response);
//       print("/*******************2");
//       if (response is List) {
//         _noteslist = response.map((e) => NotesModel.fromJson(e)).toList();
//         print("/*******************3");
//       }
//     } catch (e) {
//       print("Error getting offers: $e");
//     } finally {
//       update();
//     }
//   }

//   /// **********************
//   // Function to delete a note from Firestore
//   Future<bool> deleteNote(String noteId) async {
//     try {
//       // Delete the note from Firestore using its ID
//       await _database.collection("notes").doc(noteId).delete();
//       // Remove the note from the local list
//       _noteslist.removeWhere((note) => note.id == noteId);
//       Get.snackbar("Note Delete", "Your Data Delete Successfully");
//       return true;
//     } catch (e) {
//       print("Error deleting note: $e");
//       return false;
//     } finally {
//       update();
//     }
//   }

//   /// ******************
//   // Function to edit a note in Firestore
//   Future<void> editNote(String noteId, Map<String, dynamic> updatedData) async {
//     try {
//       await _database.collection("notes").doc(noteId).update(updatedData);
//       int index = _noteslist.indexWhere((note) => note.id == noteId);
//       _noteslist[index] = NotesModel.fromJson(updatedData).copyWith(id: noteId);
//       NotesModel.fromJson(updatedData).copyWith(id: noteId);
//       print("Note updated successfully");
//       Get.snackbar("Update Notes", "Note updated successfully");
//     } catch (e) {
//       print("Error editing note: $e");
//     } finally {
//       update();
//     }
//   }
// }
