// ignore_for_file: public_member_api_docs, sort_constructors_first
enum notestate { Complete, Progress }

class NotesModel {
  String? title, subtitle, id;
  DateTime? createdate, expiredate;
  notestate? notestatus;

  NotesModel(
      {this.title,
      this.subtitle,
      this.id,
      this.createdate,
      this.expiredate,
      this.notestatus});

  NotesModel.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        title = json["title"] ?? "",
        subtitle = json["subtitle"] ?? "",
        createdate = json["createdate"] != null
            ? DateTime.parse(json["createdate"])
            : null,
        expiredate = json["expiredate"] != null
            ? DateTime.parse(json["expiredate"])
            : null,
        notestatus = (json["notestate"] != null)
            ? notestate.values.firstWhere(
                (e) => e.name == json["notestate"],
                orElse: () => notestate.Progress,
              )
            : notestate.Progress;

  NotesModel copyWith({
    String? title,
    String? subtitle,
    String? id,
    DateTime? createdate,
    DateTime? expiredate,
  }) {
    return NotesModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      id: id ?? this.id,
      createdate: createdate ?? this.createdate,
      expiredate: expiredate ?? this.expiredate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "createdate": createdate?.toIso8601String(),
      "expiredate": expiredate?.toIso8601String(),
      "notestate": (notestatus ?? notestate.Progress).name
    };
  }

  // @override
  // String toString() => 'NotesModel(id: $id, expiredate: $expiredate)';
}
