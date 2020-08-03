import 'dart:async';

import 'package:arathsbaby_app/models/productModel.dart';
import 'package:arathsbaby_app/pages/detail_product.dart';
import 'package:arathsbaby_app/pages/product_grid.dart';
import 'package:arathsbaby_app/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  ProductGrid() : super();
  final String title = "Productos";

  @override
  ProductGridState createState() => ProductGridState();
}

class ProductGridState extends State<ProductGrid> {
  StreamController<int> streamController = new StreamController<int>();
  final servicesproducts = new ProductService();
  gridview(AsyncSnapshot<List<ProductModel>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (product) {
            return GestureDetector(
              child: GridTile(
                child: ProductCellPage(),
              ),
              onTap: () {
                goToDetails(context, product);
              },
            
            );
          },
        ).toList(),
      ),
    );
  }

  goToDetails(BuildContext context, ProductModel product) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => DetailProduct(
            curProduct: product,
          ),
        ));
  }

  productClick(ProductModel product) {
    print("Tapped ${product.name}");
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: StreamBuilder(
            initialData: 0,
            stream: streamController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text('${widget.title}${snapshot.data}');
            }),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<ProductModel>>(

                future: servicesproducts.getProducts(),
                builder: (context, snapshot) {
                  print (snapshot.error);
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    streamController.sink.add(snapshot.data.length);
                  }
                  return circularProgress();
                }),
          ),
        ],
      ),
    );
  }

  @override
  void disponse() {
    streamController.close();
    super.dispose();
  }
}
