import 'dart:convert';
import 'dart:io';
import 'package:arathsbaby_app/models/productModel.dart';
import 'package:flutter/material.dart';

import 'detail_product.dart';

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
      /*drawer: Container(
        
        width: 170.0,
        child: Drawer(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            color: Colors.pink[50],
            child: new ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                Container(
                  height: 120,
                  child: new UserAccountsDrawerHeader(
                    accountName: new Text(''),
                    accountEmail: new Text(''),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: new Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage(),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),*/
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
                      Divider(
                        height: 5.0,
                      ),
                      Text(
                        "\$ ${item.price}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
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
