import 'package:arathsbaby_app/pages/grid_product.dart';
import 'package:arathsbaby_app/pages/home_page.dart';
import 'package:arathsbaby_app/pages/login_page.dart';
import 'package:arathsbaby_app/pages/products_page.dart';
import 'package:flutter/material.dart';
import './pages/login_page.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    routes:{
      'gridProduct':(context) => GridProduct(),
      'productsPage':(context)=>ProductsPage(),
      'homePage':(context) => HomePage(),
    },
    home : new LoginPage()
    ));
}