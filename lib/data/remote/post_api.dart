import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:redsocial/domain/entities/post_entity.dart';

class PostListApi {
  final url = 'https://gorest.co.in/public-api/comments';
  Future<List<PostEntity>> getPostList() async {
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final List<PostEntity> posts = new List();
    dynamic res = decodeData['data'];
    res.forEach((value) {
      final item = PostEntity.fromJson(value);
      posts.add(item);
    });
    return posts;
  }
}
