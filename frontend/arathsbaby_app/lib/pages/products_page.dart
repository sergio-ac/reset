import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: Container(
              height: 25.0,
              child: ListView(
                scrollDirection: Axis.horizontal,                  
                children: <Widget>[
                  CategoryItemWidget(
                    name: "Accesorios",
                  ),
                  CategoryItemWidget(
                    name: "Widgets",
                  ),
                  CategoryItemWidget(
                    name: "Bebes",
                  ),
                  CategoryItemWidget(
                    name: "Mascotas",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 477.0,
            child: ListView(children: <Widget>[
              
              PruebaItemWidget(
                name: "Mochila",
                price: "\$ 150",
                imagePath: "assets/mochila.jpg",
                
              ),
              PruebaItemWidget(
                name: "Mordedera",
                price: "\$ 100",
                imagePath: "assets/mordedera.jpg",
                
              ),
              PruebaItemWidget(
                name: "Sandalias",
                price: "\$ 50",
                imagePath: "assets/sandalias.jpg",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final String name;

  const CategoryItemWidget({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        color: Colors.pinkAccent,
        height: 25,
        width: 100,
        child: Stack(children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 5,
            bottom: 5,
            child: new Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class PruebaItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

 

  const PruebaItemWidget(
      {Key key,
      this.name,
      this.price,
      this.imagePath,
      })
      : super(key: key);

  Widget productImage() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start:10,end:25),
        child: Image.asset(
      imagePath,
      height: 200.0,
      width: 150.0,
      alignment: Alignment.topLeft,
    ));
  }

  Widget textName() {
    return Container(
      padding: const EdgeInsetsDirectional.only(bottom:5),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget textPrice() {
    return Container(
      padding:const EdgeInsetsDirectional.only(bottom:10),
      child: Text(
        price,
        style: TextStyle(
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }

  

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 28),
      height: 250,
      child: Row(
        children: <Widget>[
          productImage(),
          Column(
      
            children: <Widget>[
              
              textName(),
              textPrice(),
              
            ],
          ),
        ],
      ),
    );
  }
}
