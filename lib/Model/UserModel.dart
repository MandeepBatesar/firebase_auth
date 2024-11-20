import 'package:cloud_firestore/cloud_firestore.dart';

// class Usermodel {
//   String? id, name, email, image, address;
//   int? phonenumber;
//   Usermodel(
//       {this.id = "",
//       this.name = "",
//       this.email = "",
//       this.phonenumber ,
//       this.image = "",
//       this.address});

// //  Copy With
//   Usermodel copyWith(
//       {String? id,
//       String? name,
//       String? email,
//       int? phonenumber,
//       String? image,
//       String? address}) {
//     return Usermodel(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         phonenumber: phonenumber ?? this.phonenumber,
//         image: image ?? this.image,
//         address: address ?? this.address);
//   }

//   // To Map
//   Map<String, dynamic> tomap() {
//     return {
//       "id": id,
//       "name": name,
//       "email": email,
//       "phonenumber": phonenumber,
//       "image": image,
//       "Adress": address
//     };
//   }

//   // From Json
//   Usermodel.fromjson(Map<String, dynamic> json)
//       : id = json["id"] ?? "",
//         name = json["name"] ?? "",
//         email = json["email"] ?? "",
//         phonenumber = json["phonenumber"] ?? 0,
//         image = json["image"] ?? "",
//         address = json["address"] ?? "";
// }

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docid;
  FirebaseResponseModel(this.data, this.docid);
  FirebaseResponseModel.fromResonse(DocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docid = snapshot.id;
}

class Usermodel {
  String id, name, email;
  int number;
  List<String> roomIds;
  bool isOnline;
  DateTime? lastSeen;
  bool isTyping;
  String? image;

  Usermodel({
    this.id = "",
    this.name = "",
    this.email = "",
    this.number = 0,
    this.roomIds = const [],
    this.isOnline = false,
    this.lastSeen,
    this.isTyping = false,
    this.image = "",
  });

  // Copy With
  Usermodel copyWith({
    String? id,
    String? name,
    String? email,
    int? number,
    List<String>? roomIds,
    bool? isOnline,
    DateTime? lastSeen,
    bool? isTyping,
    String? image,
  }) {
    return Usermodel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      roomIds: roomIds ?? this.roomIds,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      isTyping: isTyping ?? this.isTyping,
      image: image ?? this.image,
    );
  }

  // To JSON
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": number,
      "roomIds": roomIds,
      "isOnline": isOnline,
      "lastSeen": lastSeen?.toIso8601String(),
      "isTyping": isTyping,
      "image": image,
    };
  }

  // From JSON
  Usermodel.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        email = json["email"] ?? "",
        number = (json["phonenumber"] is int)
            ? json["phonenumber"]
            : int.tryParse(json["phonenumber"].toString()) ?? 0,
        roomIds = (json["roomIds"] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        isOnline = json["isOnline"] ?? false,
        lastSeen =
            json["lastSeen"] != null ? DateTime.parse(json["lastSeen"]) : null,
        isTyping = json["isTyping"] ?? false,
        image = json["image"] ?? "";
}
