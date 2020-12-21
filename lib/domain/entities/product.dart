class Product {
//   Product({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.price,
//     this.discount_amount,
//   });

//   int id;
//   String name;
//   String description;
//   String image;
//   String price;
//   String discount_amount;
// }

  final int id;
  final String name;
  final String description;
  final String price;
  final String discount_amount;
  final String image;

  Product.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        description = valueOrDefaultValue(jsonMap['description']),
        price = valueOrDefaultValue(jsonMap['price']),
        discount_amount = valueOrDefaultValue(jsonMap['discount_amount']),
        image = valueOrDefaultValue(jsonMap['image']) {}
}

class Origin {
  final String name;

  Origin.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

class Location {
  final String name;
  Location.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
