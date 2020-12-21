// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    UsersModel({
        this.id,
        this.name,
        this.email,
        this.gender,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String email;
    String gender;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
