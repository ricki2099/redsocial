import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  ProductsCard({
    @required this.name,
    @required this.description,
    @required this.image,
    this.price,
    this.discount_amount,
  });
  final String name, description, image, price, discount_amount;

  @override
  Widget build(BuildContext context) {
    final cardImage = Container(
      height: 250,
      width: 250,
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          // fit: BoxFit.,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );
    final data = Positioned(
      bottom: 0,
      left: 10.0,
      right: 10.0,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            name,
                            style: TextStyle(
                              // fontFamily: "Lato",
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Precio: " + price,
                            style: TextStyle(
                              // fontFamily: "Lato",
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            ElevatedButton.icon(
                              label: Text('Comprar'),
                              icon: Icon(Icons.payment),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            ElevatedButton.icon(
                              label: Text('Cancelar'),
                              icon: Icon(Icons.cancel),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                onSurface: Colors.grey,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  name,
                  style: TextStyle(
                    // fontFamily: "Lato",
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Precio: " + price,
                  style: TextStyle(
                    // fontFamily: "Lato",
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  " Descuento: " + discount_amount,
                  style: TextStyle(
                    // fontFamily: "Lato",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Stack(
      children: [cardImage, data],
    );
  }
}
