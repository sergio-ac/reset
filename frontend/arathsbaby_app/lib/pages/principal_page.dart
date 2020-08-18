import 'dart:convert';
import 'dart:io';
import 'package:arathsbaby_app/models/productModel.dart';
import 'package:arathsbaby_app/pages/products_page.dart';
import 'package:arathsbaby_app/pages/user_page.dart';
import 'package:flutter/material.dart';

import 'detail_product.dart';
import 'list_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData() async {
    String salida = '';
    HttpClient httpClient = new HttpClient();
    final request = await httpClient
        .getUrl(Uri.parse("http://192.168.0.2:81/api/Product/GetProduct"));
    request.headers.set('content-type', 'application/json');
    final response = await request.close();
    salida = await response.transform(utf8.decoder).join();
    print('salida de principal' + '$salida');
    final responsedecode = json.decode(salida);
    print('responsedecode de principal' + '$responsedecode');
    final producttemp = new Products.fromJsonList(responsedecode);
    print('modelo  ' + '${producttemp.products}');

    setState(() {
      _productosModel = producttemp.products;
    });
  }

  void goToDetails(BuildContext context, Product product) {
    Navigator.of(context).push(MaterialPageRoute(
      //fullscreenDialog: true,
      builder: (BuildContext context) => DetailProduct(
        curProduct: product,
      ),
    ));
  }

  List<Product> _listaCarro = List<Product>();
  List<Product> _productosModel = List<Product>();
  @override
  void initState() {
    super.initState();
    getData();
    //_productDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
        title: new Text("Araths Baby"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 38,
                  ),
                  if (_listaCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _listaCarro.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_listaCarro.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                    ),
                  );
              },
            ),
          )
        ],
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: new Drawer(
        child: Container(
          color: Colors.pinkAccent[50],
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Sergio Alejo"),
                accountEmail: new Text("s@gmail.com"),
                currentAccountPicture: new GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new UserPage("Usuario")));
                  },
                  child: new CircleAvatar(
                    backgroundImage: AssetImage("assets/user.jpg"),
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/logo.png"))),
              ),
              new ListTile(
                title: new Text("Productos"),
                trailing: new Icon(Icons.view_list),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ProductsPage()));
                },
              ),
              new ListTile(
                title: new Text("Pruebas"),
                trailing: new Icon(Icons.new_releases),
                onTap: () {
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(new MaterialPageRoute(builder : (BuildContext context) => new PruebasPage());
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text("Cerrar"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _productosModel.length,
        itemBuilder: (context, index) {
          final String image = _productosModel[index].photo;
          print('Imagen recibida al principal ' + '$image');
          var item = _productosModel[index];
          return Card(
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: new Image.network("$image", fit: BoxFit.contain),
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      
                      SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          SizedBox(width:20),
                          Text(
                            "\$ ${item.price}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 60,),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                child: (!_listaCarro.contains(item))
                                    ? Icon(
                                        Icons.shopping_cart,
                                        color: Colors.green,
                                        size: 38,
                                      )
                                    : Icon(
                                        Icons.shopping_cart,
                                        color: Colors.red,
                                        size: 38,
                                      ),
                                onTap: () {
                                  setState(() {
                                    if (!_listaCarro.contains(item))
                                      _listaCarro.add(item);
                                    else
                                      _listaCarro.remove(item);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    goToDetails(context, item);
                  },
                ),
              ],
            ),
          );
        });
  }
}
