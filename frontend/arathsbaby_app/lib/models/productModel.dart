 import 'dart:convert';
class Products{
  
  final List<ProductModel> products;
  
  Products({
    
    this.products
    
    });
  
  factory Products.fromJson(List<dynamic> parsedJson){
    
    List<ProductModel> _products = new List<ProductModel>();
    
    _products = parsedJson.map((e)=>ProductModel.fromJson(e)).toList();
   print ('Estoy aqui '+'$_products');
    return new Products(

      products: _products,

      );

  }
  }


class ProductModel {
  int id;
  String name;
  String category;
  int price;
  String description;
  String photo;
  int quantity;
  String color;

  ProductModel({
     this.id,
      this.name,
      this.category,
      this.price,
      this.description,
      this.photo,
      this.quantity,
      this.color
      });

  factory ProductModel.fromJson(Map<String, dynamic> json)=> new ProductModel(
    

    id            :     json["id"] ,
    name          :     json["name"],
    category      :     json["category"] ,
    price         :     json["price"],
    description   :     json["description"],
    photo         :     json["photo"],
    quantity      :     json["quantity"],
    color         :     json["color"],
    );
  

  Map<String, dynamic> toJson()=> {
    
    "id"            : id,
    "name"          : name,
    "category"      : category,
    "price"         : price,
    "description"   : description,
    "photo"         : photo,
    "quantity"      : quantity,
    "color"         : color,
    
  };
}