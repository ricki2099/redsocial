import 'dart:convert';
import 'package:http/http.dart' as http;
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

  Future<UsersModel> createUsers(UsersModel model) async {        

    final authData = {      
      'name': model.name,
      'email': model.email,
      'gender': 'Male',
      'status': 'Active'
    };

    final resp = await http.post(AppConfig.setUsers, body: json.encode(authData), headers: {
      'Content-Type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer 9964487d9d8e191eeb927af3f9f63658cd4cb8a4687c773213a2e595d32a7717'
    });

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return null; //new UsersModel();

    // print('Data sin Formato');
    // print(decodedData['data']);

    UsersModel iUser = new UsersModel();

    dynamic result = decodedData['data'];
    
    // print('result');
    // print(result);

    final itemTemp = UsersModel.fromJson(result);

    // print('itemTemp');
    // print(itemTemp);

    iUser.id = itemTemp.id;
    iUser.name = itemTemp.name;
    iUser.email = itemTemp.email;
    iUser.gender = itemTemp.gender;
    iUser.status = itemTemp.status;
    iUser.createdAt = itemTemp.createdAt;
    iUser.updatedAt = itemTemp.updatedAt;
    
    // print('iUser ID');
    // print(iUser.id);

    return iUser;
        
  }
}
