// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:redsocial/domain/entities/product.dart';

// class ProductApi {
//   List<Product> products = [];

//   Future<void> getProducts() async {
//     String url = "https://gorest.co.in/public-api/products";
//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);
//     // print(jsonData['data']['Items']);
//     jsonData['data'].forEach((element) {
//       if (element['id'] != null) {
//         Product product = Product(
//           name: element['name'],
//           description: element['description'],
//           image: element['image'],
//           price: element['price'],
//           discount_amount: element['discount_amount'],
//         );
//         products.add(product);
//         // print(products);
//       }
//     });
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:redsocial/domain/entities/product.dart';

class ProductApi {
  final String _baseUrl = 'gorest.co.in';
  final String _characterUrl = '/public-api/products';
  final String _charactersJsonKey = 'data';

  final HttpClient _httpClient = HttpClient();

  Future<List<Product>> getProducts() async {
    final uri = Uri.https(_baseUrl, _characterUrl);
    final response = await _getJson(uri);

    if (response == null || response[_charactersJsonKey] == null) {
      print('CharacterApi._getCharacters(): Error while retriving characters');
      return null;
    }

    return _convert(response[_charactersJsonKey]);
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        print(
            'CharacterApi._getJson($uri) status code is ${response.statusCode}');
        return null;
      }
      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('CharacterApi._getJson($uri) exception thrown $e');
      return null;
    }
  }

  List<Product> _convert(List charactersJson) {
    List<Product> characters = <Product>[];
    charactersJson.forEach((character) {
      characters.add(Product.fromJson(character));
    });
    return characters;
  }
}
