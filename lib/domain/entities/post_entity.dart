import 'dart:convert';

PostEntity postEntityFromJson(String str) {
  return PostEntity.fromJson(json.decode(str));
}

String postEntityToJson(PostEntity data) {
  return json.encode(data.toJson());
}

class PostEntity {
  int id;
  int userId;
  String title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  PostEntity({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      body: json['body'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'body': body,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
