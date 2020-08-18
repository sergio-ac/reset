import 'package:arathsbaby_app/models/productModel.dart';
import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;

  List<Product> _cart;

  Container pagoTotal(List<Product> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          // Text("Total:  \$${valorTotal(_cart)}",
          //Text("Total:  ",
          Text("Total:  \$${valorTotal(_cart)}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    );
  }

  String valorTotal(List<Product> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + listaProductos[i].price * listaProductos[i].elected;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.store,
              color: Colors.white,
            ),
            onPressed: null,
            color: Colors.white,
          )
        ],
        title: Text('Carrito',
            style: new TextStyle(
                /*fontWeight: FontWeight.bold,
                fontSize: 14.0,*/
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollController
                  .jumpTo(_scrollController.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].photo;
                  var item = _cart[index];
                  //item.quantity = 0;
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 130,
                                  child: new Image.network("$imagen",
                                      fit: BoxFit.contain),
                                ),
                                SizedBox(width: 30),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 80,
                                      child: Text(item.name,
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.pink[600],
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Colors.pink[400],
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              )),
                                          margin: EdgeInsets.only(top: 20.0),
                                          padding: EdgeInsets.all(2.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  _removeProduct(index);
                                                  valorTotal(_cart);
                                                  // print(_cart);
                                                },
                                                color: Colors.yellow,
                                              ),
                                              Text('${_cart[index].elected}',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.0,
                                                      color: Colors.white)),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  _addProduct(index);
                                                  valorTotal(_cart);
                                                },
                                                color: Colors
                                                    .yellow, // print(_cart);
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('\$${item.price.toString()}',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.purple,
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("PAGAR"),
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => FancyDialog(
                              title: "ACEPTA PAGAR LA COMPRA",
                              descreption: "Bien pues pague :), Click OK",
                              animationType: FancyAnimation.BOTTOM_TOP,
                              theme: FancyTheme.FANCY,
                              gifPath:
                                  FancyGif.MOVE_FORWARD, //'./assets/walp.png',
                              okFun: () => {
                                msgListaPedido(),
                              },
                            ))
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ))),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].elected++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].elected--;
    });
  }

  void msgListaPedido() async {
    String pedido = "";
    String fecha = DateTime.now().toString();
    pedido = pedido + "Fecha:" + fecha.toString();
    pedido = pedido + "\n";
    pedido = pedido + "Cliente: Flutter Dart";
    pedido = pedido + "\n";
    pedido = pedido + "______________________";
    for (int i = 0; i < _cart.length; i++) {
      pedido = '$pedido' +
          "\n" +
          "Producto : " +
          _cart[i].name +
          "\n" +
          "Cantidad: " +
          "\n" +
          _cart[i].elected.toString() +
          "\n" +
          "Precio: " +
          _cart[i].price.toString() +
          "\n" +
          "\_____________________________\n";
    }
    pedido = pedido + "Total: " + valorTotal(_cart);

    await launch("https://wa.me/\$(+528127256525)?text=$pedido");
  }
}
