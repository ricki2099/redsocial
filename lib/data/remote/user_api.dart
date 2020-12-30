import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redsocial/bloc/users_bloc.dart';
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

  Future<UserEntity> getLogin(String password) async {

    final response = await http.get('$url/?id=$password');
    final Map<String, dynamic> decodeData = json.decode(response.body);
    //final UserEntity iUser = new UserEntity();
    List<dynamic> res = decodeData['data'];
    
    print(res);

    UserEntity iUser = new UserEntity();
    if (res.length > 0) {
      iUser = UserEntity.fromJson(res[0]);
      print(iUser);
    } else {
      return null;
    }

    return iUser;

  }

  Future<UserEntity> registerUsers(UserEntity model) async {

    final authData = {      
        'name': model.name,
        'email': model.email,
        'gender': 'Male',
        'status': 'Active'
      };

      // final resp = await http.post(url, body: json.encode(authData), headers: {
      //   'Content-Type' : 'application/json; charset=UTF-8',
      //   'Authorization' : 'Bearer 9964487d9d8e191eeb927af3f9f63658cd4cb8a4687c773213a2e595d32a7717'
      // });

      final resp = await http.post(url, body: json.encode(authData), headers: {
        'Content-Type' : 'application/json; charset=UTF-8',
        'Authorization' : 'Bearer a961a1f63fd60a965789c0d6b779e2211645d93226b5df05d0126575e50e7b05'
      });

      // var resp = await httpManager.post(
      //   'users', authData);

      final Map<String, dynamic> decodedData = json.decode(resp.body);

      if (decodedData == null) return null; //new UserEntity();

      UserEntity iUser = new UserEntity();

      dynamic result = decodedData['data'];

      final itemTemp = UserEntity.fromJson(result);

      iUser.id = itemTemp.id;
      iUser.name = itemTemp.name;
      iUser.email = itemTemp.email;
      iUser.gender = itemTemp.gender;
      iUser.status = itemTemp.status;
      iUser.createdAt = itemTemp.createdAt;
      iUser.updatedAt = itemTemp.updatedAt;

      return iUser;

    // try {      

    // } catch (e) {
    //   return null;
    // }
  }  


  // Future<UserEntity> createUsers(UserEntity model) async {        

  //   final authData = {      
  //     'name': model.name,
  //     'email': model.email,
  //     'gender': 'Male',
  //     'status': 'Active'
  //   };

  //   final resp = await http.post(AppConfig.setUsers, body: json.encode(authData), headers: {
  //     'Content-Type' : 'application/json; charset=UTF-8',
  //     'Authorization' : 'Bearer 9964487d9d8e191eeb927af3f9f63658cd4cb8a4687c773213a2e595d32a7717'
  //   });

  //   final Map<String, dynamic> decodedData = json.decode(resp.body);

  //   if (decodedData == null) return null; //new UserEntity();

  //   // print('Data sin Formato');
  //   // print(decodedData['data']);

  //   UserEntity iUser = new UserEntity();

  //   dynamic result = decodedData['data'];
    
  //   // print('result');
  //   // print(result);

  //   final itemTemp = UserEntity.fromJson(result);

  //   // print('itemTemp');
  //   // print(itemTemp);

  //   iUser.id = itemTemp.id;
  //   iUser.name = itemTemp.name;
  //   iUser.email = itemTemp.email;
  //   iUser.gender = itemTemp.gender;
  //   iUser.status = itemTemp.status;
  //   iUser.createdAt = itemTemp.createdAt;
  //   iUser.updatedAt = itemTemp.updatedAt;
    
  //   // print('iUser ID');
  //   // print(iUser.id);

  //   return iUser;
        
  // }


}
