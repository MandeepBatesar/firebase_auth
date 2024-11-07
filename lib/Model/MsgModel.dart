class MsgModel {
  String? sender;
  String? txt;
  bool? seen;
  DateTime? createdon;
  MsgModel({
    this.sender,
    this.txt,
    this.seen,
    this.createdon,
  });

  MsgModel.frommsgmodel(Map<String, dynamic> json)
      : sender = json["sender"] ?? "",
        txt = json["txt"] ?? "",
        seen = json["seen"] ?? false,
        createdon = json["createdon"].toDate();

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'txt': txt,
      'seen': seen,
      'createdon': createdon?.millisecondsSinceEpoch,
    };
  }

  MsgModel copyWith({
    String? sender,
    String? txt,
    bool? seen,
    DateTime? createdon,
  }) {
    return MsgModel(
      sender: sender ?? this.sender,
      txt: txt ?? this.txt,
      seen: seen ?? this.seen,
      createdon: createdon ?? this.createdon,
    );
  }
}
