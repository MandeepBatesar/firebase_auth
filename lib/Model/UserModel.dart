import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  String? id, name, email, image, address;
  int? phonenumber;
  Usermodel(
      {this.id = "",
      this.name = "",
      this.email = "",
      this.phonenumber ,
      this.image = "",
      this.address});

//  Copy With
  Usermodel copyWith(
      {String? id,
      String? name,
      String? email,
      int? phonenumber,
      String? image,
      String? address}) {
    return Usermodel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phonenumber: phonenumber ?? this.phonenumber,
        image: image ?? this.image,
        address: address ?? this.address);
  }

  // To Map
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phonenumber,
      "image": image,
      "Adress": address
    };
  }

  // From Json
  Usermodel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        email = json["email"] ?? "",
        phonenumber = json["phonenumber"] ?? 0,
        image = json["image"] ?? "",
        address = json["address"] ?? "";
}

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docid;
  FirebaseResponseModel(this.data, this.docid);
  FirebaseResponseModel.fromResonse(DocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docid = snapshot.id;
}
