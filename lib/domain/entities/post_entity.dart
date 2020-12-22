// To parse this JSON data, do
//
//     final postEntity = postEntityFromJson(jsonString);

import 'dart:convert';

PostEntity postEntityFromJson(String str) {
  return PostEntity.fromJson(json.decode(str));
}

String postEntityToJson(PostEntity data) {
  return json.encode(data.toJson());
}

class PostEntity {
  int id;
  int postId;
  String name;
  String email;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  PostEntity({
    this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json["id"],
      postId: json["post_id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "post_id": postId,
      "name": name,
      "email": email,
      "body": body,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
