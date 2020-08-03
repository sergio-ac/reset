import 'package:arathsbaby_app/models/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget{
  final ProductModel curProduct;
  DetailProduct({@required this.curProduct});
  @override 
  DetailProductState createState() => DetailProductState();
}

class DetailProductState extends State<DetailProduct>{
  @override 

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        alignment:Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children:<Widget>[
            Hero(
              tag: "image${widget.curProduct.id}",
              child:FadeInImage.assetNetwork(
              placeholder: null, 
              image: widget.curProduct.photo,
              ),
            ),
            
              SizedBox(
                height:30.0,
                ),
              OutlineButton(
                onPressed: ()=>Navigator.of(context).pop(),
              ),  

          ],
        ),
      ) ,

    );
  }
}