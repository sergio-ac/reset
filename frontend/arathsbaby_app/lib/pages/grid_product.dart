import 'dart:convert';

import 'package:arathsbaby_app/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var baseurl = "http://10.0.2.2:5000/api/";
var url = "${baseurl}Product/GetProduct";

class GridProduct extends StatefulWidget {
  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  Product Producto;

  void initState() {
    super.initState();
    _listproduct();
  }

  void _listproduct() async {
    var response = await http.get(url);
    var decodeJson = jsonDecode(response.body);
    setState(() {
      Producto = Product.fromJson(decodeJson);
      print(decodeJson);
      

      for (var item in decodeJson) {
        var p = new Product();
        p.id = item['id'];
        p.name = item['name'];
        p.price = item['price'];
        p.photo = item['photo'];
        setState(() {
          _list.add(p);
        });
      }
      
    });
  }

  /* void _incrementCounter() async {
    var response = await http.get("");
    var info = json.decode(response.body);
    for (var item in info){
      var p = new Product();
      p.id = item['id'];
      p.name=item['name'];
      p.price=item['price'];
      p.photo=item['photo']
      setState(() {
        _list.add(p);
      });
      
    }
  }
  */
  List<Product> _list = new List();
  Widget gridp (){
    return GridView.count(
      crossAxisCount: 3
      
      );
  }
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
          new Flexible(
            child: new GridView.count(
                crossAxisCount: 2,
                children: _list.map((l) {
                  return new GridTile(
                    child: new Column(
                      children: <Widget>[
                        new Image.network(l.photo),
                        new Text(l.name),
                        new Text("$l.price"),
                      ],
                    ),
                  );
                }).toList()),
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
