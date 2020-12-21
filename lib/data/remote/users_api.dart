import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redsocial/domain/entities/users.model.dart';
import 'package:redsocial/managers/http_manager.dart';

class UsersAPI {
  final HttpManager httpManager = HttpManager();
  
  Future<List<UsersModel>> getLogin() async {

    dynamic resp = await httpManager.get('/character');
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    print(decodedData);

  }
}
