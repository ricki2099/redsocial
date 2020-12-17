import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redsocial/domain/entities/product.dart';

class ProductApi {
  List<Product> products = [];

  Future<void> getProducts() async {
    String url = "https://gorest.co.in/public-api/products";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    // print(jsonData['data']['Items']);
    jsonData['data'].forEach((element) {
      if (element['id'] != null) {
        Product product = Product(
          name: element['name'],
          description: element['description'],
          image: element['image'],
          price: element['price'],
          discount_amount: element['discount_amount'],
        );
        products.add(product);
        // print(products);
      }
    });
  }
}
