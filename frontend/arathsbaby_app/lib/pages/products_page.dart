import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Pruebas"), backgroundColor: Colors.pinkAccent),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Bienvenidos",
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            height: 75.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.pinkAccent,
                      child: Text("Posición $position"),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 15.0),
            child: Container(
              height: 350.0,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                PruebaItemWidget(
                  title: "Mochila",
                  imagePath: "assets/mochila.jpg",
                  price: "\$ 150",
                ),
                PruebaItemWidget(
                  title: "Mordedera",
                  imagePath: "assets/mordedera.jpg",
                  price: "\$ 100",
                ),
                PruebaItemWidget(
                  title: "Sandalias",
                  imagePath: "assets/sandalias.jpg",
                  price: "\$ 50",
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class PruebaItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String price;

  const PruebaItemWidget({Key key, this.title, this.imagePath, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:0.0,vertical:2.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: new Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: new Text(
                price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 0,
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 150.0,
                  width: 150.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
