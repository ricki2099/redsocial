import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:redsocial/app_config.dart';
import 'package:redsocial/domain/entities/users.model.dart';
import 'package:redsocial/managers/http_manager.dart';

class UsersAPI {
  final HttpManager httpManager = HttpManager();
  
  Future<List<UsersModel>> getLogin(String email, String password) async {

    dynamic resp = await httpManager.get(AppConfig.getUserDataByID + password);
    final Map<String, dynamic> decodedData = json.decode(resp.body);    

    //print(decodedData);

    final List<UsersModel> users = new List();
    //final UsersModel users = new UsersModel();

    if (decodedData == null) return [];

    dynamic result = decodedData['data'];

    print(result);
        
    result.forEach((value) {
      final itemTemp = UsersModel.fromJson(value);
      users.add(itemTemp);
    });

    //print(users);
    return users;

  }
}
