class Products {
  final List<Product> products;

  Products({
    this.products,
  });

  factory Products.fromJsonList(List<dynamic> parsedJson) {
    List<Product> products = new List<Product>();
    products = parsedJson.map((i) => Product.fromJson(i)).toList();
    return new Products(products: products);
  }
}

class Product {
  int id;
  String name;
  String category;
  int price;
  String description;
  String photo;
  int quantity;
  String color;
  int elected;

  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.description,
      this.photo,
      this.quantity,
      this.color,
      this.elected});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    id : json['id'] as int,
    name : json['name'] as String,
    category : json['category'] as String,
    price : json['price']as int,
    description : json['description']as String,
    photo : json['photo']as String,
    quantity : json['quantity']as int,
    color : json['color']as String,
    elected : json['elected'] as int,
    );
  }
}
