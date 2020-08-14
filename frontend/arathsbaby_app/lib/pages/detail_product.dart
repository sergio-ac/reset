import 'package:arathsbaby_app/models/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  final Product curProduct;
  DetailProduct({@required this.curProduct});
  @override
  DetailProductState createState() => DetailProductState();
}

class DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
            ),
            Row(
              children: <Widget>[
                Text(
                  "${widget.curProduct.name}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 325.0,
              width: 400.0,
              child: Hero(
                tag: "image${widget.curProduct.id}",
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/logo.png',
                  image: widget.curProduct.photo,
                  height: 300,
                  width: 375,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 280.0,
                ),
                Text(
                  "\$ ${widget.curProduct.price}",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "${widget.curProduct.description}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 66.0),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Colores: ${widget.curProduct.color}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                Padding(padding: const EdgeInsets.only(bottom: 35.0))
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Cantidad: ${widget.curProduct.quantity}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            OutlineButton(
              child: new Icon(
                Icons.backspace,
                color: Colors.pinkAccent,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
