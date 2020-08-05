import 'package:arathsbaby_app/models/productModel.dart';
import 'package:arathsbaby_app/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductCellPage extends StatefulWidget{  
  @override 
  ProductCell createState()=>ProductCell();}
class ProductCell extends State<ProductCellPage>{
 // const ProductCell(this.product);
  @required
  ProductModel prod;
  final providerproducts = new ProductService();
  @override  
  void initState() {    
    // TODO: implement initState
    super.initState();}
  @override
  Widget build(BuildContext context){
    providerproducts.getProducts();
    prod = new ProductModel();
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius : BorderRadius.circular(10.0),),
      color:Colors.white,
      child:Padding(padding: EdgeInsets.all(10.0),
      child:Container(
        alignment: Alignment.center,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child:ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: 
                Hero(
                  tag: "images${prod.id}",
                  child:FadeInImage.assetNetwork(
                  placeholder: null, 
                  image: prod.photo,
                  width: 100,
                  height: 100,),),),),
            Padding (
              padding: EdgeInsets.all(10.0),
              child: Text(
                "${prod.price}",
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,),),),],),),));}}