import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PruebasPage extends StatefulWidget {
  @override
  _PruebasPageState createState() => _PruebasPageState();
}

class _PruebasPageState extends State<PruebasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Pruebas"), backgroundColor: Colors.pinkAccent,
          ),
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
                imagePath: "assets/mochila.jpg",
                name: "Mochila",
                price: "\$ 150",
                description: "Mochila de mickey mouse",
                color: "negro,rojo.blanco",
              ),
              PruebaItemWidget(
                imagePath: "assets/mordedera.jpg",
                name: "Mordedera",
                price: "\$ 100",
                description:
                    "Mordedera para bebe con mango de agarre especial y comodo para tu bebito xdxd",
                color: "blanco,azul,rosa",
              ),
              PruebaItemWidget(
                imagePath: "assets/sandalias.jpg",
                name: "Sandalias",
                price: "\$ 50",
                description: "Sandalias para dama",
                color: "negro,blanco,rojo,azul",
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

  final String description;
  final String color;

  const PruebaItemWidget(
      {Key key,
      this.name,
      this.price,
      this.imagePath,
      this.description,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
            child: Image.asset(
              imagePath,
              height: 200.0,
              width: 200.0,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                child: Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  "Color: $color",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
