import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redsocial/managers/token_maganer.dart';

import '../app_config.dart';

class HttpManager {

  Future<dynamic> get(url) async {
    
    final headers = await _getHeaders();
    final response = await http.Client().get(AppConfig.API_URL + url, headers: headers);
    return response;
  }

  Future<dynamic> put(url) async {
    final headers = await _getHeaders();
    final response = await http.Client().put(AppConfig.API_URL + url, headers: headers);
    final parsed = jsonDecode(response.body);
    // final success = parsed['success'];

    // if (!success){
    //   throw Exception('Error al actualizar');
    // }
    return parsed;
  }

  Future<dynamic> post(url, data) async  {
    final headers = await _getHeaders();
    final response = await http.Client().post(AppConfig.API_URL + url, 
      body: jsonEncode(data), headers: headers
    );

    final parsed = jsonDecode(response.body);
    // final success = parsed['success'];

    // if (!success){
    //   throw Exception(parsed['message']);
    // }
    return parsed;
  }  

  _getHeaders() async {
    final token = await TokenManager.getInstance().getToken();

    return {
      'Content-Type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    };
  }

}