import 'dart:convert';

UserEntity userEntityFromJson(String str) {
  return UserEntity.fromJson(json.decode(str));
}

String userEntityToJson(UserEntity data) {
  return json.encode(data.toJson());
}

class UserEntity {
  int id;
  String name;
  String email;
  String gender;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      gender: json["gender"],
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "gender": gender,
      "status": status,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
