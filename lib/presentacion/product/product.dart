import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redsocial/data/remote/product_api.dart';
import 'package:redsocial/presentacion/product/widgets/products_card.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool _loading;
  var productsList;

  void getProduct() async {
    ProductApi products = ProductApi();
    await products.getProducts();
    productsList = products.products;
    setState(() {
      _loading = false;
    });
  }

  void initState() {
    _loading = true;
    super.initState();
    getProduct();
    _loading = false;
  }

  final titleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    final contenido = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Productos',
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        // actions: [],
        leading: IconButton(
          icon: Icon(
            Icons.store_mall_directory,
            color: Colors.black,
          ), // set your color here
          onPressed: () {},
        ),
      ),
      body: (_loading = false)
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Productos',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 250,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: productsList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductsCard(
                            // urlImage: charactersList[index].urlImage ?? "",
                            name: productsList[index].name ?? "",
                            description: productsList[index].description ?? "",
                            image: productsList[index].image ?? "",
                            price: productsList[index].price ?? "",
                            discount_amount:
                                productsList[index].discount_amount ?? "",
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );

    return SafeArea(child: contenido);
  }
}
