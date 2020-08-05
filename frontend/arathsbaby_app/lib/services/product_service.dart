import 'dart:convert';
import 'dart:io';
import 'package:arathsbaby_app/models/productModel.dart';
import 'package:http/http.dart' as http;
class ProductService{    
    Future<List<ProductModel>>getProducts()async{            
      String salida='';      
      HttpClient httpClient = new HttpClient();
      final request = await httpClient.getUrl(
      Uri.parse("http://192.168.0.2:81/api/Product/GetProduct"));
      request.headers.set('content-type', 'application/json');
      final response = await request.close();      
      salida=await response.transform(utf8.decoder).join();
      print ('salida '+ '$salida');
      final responsedecode = json.decode(salida);
      print('responsedecode ' + '$responsedecode');
      final producttemp = new Products.fromJson(responsedecode);
      print('modelo  ' + '$producttemp');
      return producttemp.products;
    }
  }

  