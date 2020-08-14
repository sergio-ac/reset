import 'dart:convert';
import 'dart:io';
import 'package:arathsbaby_app/models/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String url = "http://192.168.0.2:81/api/Product/GetProduct";
  Future<List<Product>> getProducts() async {
    final response = await http.get(url);
    print('Response recibido ' + '$response');
    List<Product> list = parseProducts(response.body);

    print('Lista de productos ' + '$list');
    
    return list;
  }

  static List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    print ('Final parsed decode '+ '$parsed');
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
