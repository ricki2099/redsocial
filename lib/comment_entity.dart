class CommentEntity {
  int id;
  int postId;
  String name;
  String email;
  String body;
  String createdAt;
  String updatedAt;
  int index;

  CommentEntity({
    this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.index
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity(
      id: json["id"] ?? 0,
      postId: json["post_id"] ?? 0,
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      body: json["body"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }

  static List<CommentEntity> fromJSONList(List<dynamic> jsonlist) {
    List<CommentEntity> items = List<CommentEntity>();
    if (jsonlist.isNotEmpty) {
      jsonlist.forEach((dynamic json) {
        items.add(CommentEntity.fromJson(json));
      });
    }
    return items;
  }

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };
}
