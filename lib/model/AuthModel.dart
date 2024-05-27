class Authmodel {
  String? name, gmail, phn_number, address, img, uid;
  Authmodel(
      {this.name = "",
      this.gmail = "",
      this.phn_number = "",
      this.address = "",
      this.img = "",
      this.uid});
  Authmodel.fromAuthmodel(Map<String, dynamic> json, this.uid)
      : name = json["name"] ?? "",
        gmail = json["gmail"] ?? "",
        phn_number = json["phn_number"] ?? "",
        img = json["img"] ?? "",
        address = json["address"] ?? "";

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "gmail": gmail,
      "phn_number": phn_number,
      "address": address,
      "img": img,
    };
  }

  Authmodel copyWith({String? name, gmail, phn_number, img, address, uid}) {
    return Authmodel(
        name: name ?? this.name,
        gmail: gmail ?? this.gmail,
        phn_number: phn_number ?? this.phn_number,
        address: address ?? this.address,
        img: img ?? img,
        uid: uid ?? this.uid);
  }
}
