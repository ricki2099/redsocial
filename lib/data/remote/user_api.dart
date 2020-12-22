import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:redsocial/domain/entities/user_entity.dart';

class UserApi {
  final url = 'https://gorest.co.in/public-api/users';

  Future<List<UserEntity>> getUsers() async {
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final List<UserEntity> users = new List();
    dynamic res = decodeData['data'];
    res.forEach((value) {
      final item = UserEntity.fromJson(value);
      users.add(item);
    });
    return users;
  }

  Future<String> getUserNameById({int userId}) async {
    final response = await http.get('$url/$userId');
    final Map<String, dynamic> decodeData = json.decode(response.body);
    dynamic res = decodeData['data'];
    return res['name'];
  }
}
