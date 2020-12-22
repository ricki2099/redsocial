import 'dart:convert';
import 'package:http/http.dart' as http;
const String API_URL = 'https://gorest.co.in/public-api/';

class HttpManager {
  Future<dynamic> get(url) async {
    final headers = await _getHeaders();
    final response = await http.Client().get(API_URL + url, headers: headers);
    final parsed = jsonDecode(response.body);

    return parsed;
  }

  Future<dynamic> put(url) async {
    final headers = await _getHeaders();
    final response = await http.Client().put(API_URL + url, headers: headers);
    final parsed = jsonDecode(response.body);
    return parsed;
  }

  Future post(url, data) async {
    final headers = await _getHeaders();
    final response = await http.Client()
        .post(API_URL + url, body: jsonEncode(data), headers: headers);
    final parsed = jsonDecode(response.body);
    return parsed;
  }

  _getHeaders() async {
    return {'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer a961a1f63fd60a965789c0d6b779e2211645d93226b5df05d0126575e50e7b05'
    };
  }
}
