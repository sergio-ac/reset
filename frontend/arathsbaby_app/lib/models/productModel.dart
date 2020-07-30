class Product {
  int id;
  String name;
  String category;
  int price;
  String description;
  String photo;
  int quantity;
  String color;

  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.description,
      this.photo,
      this.quantity,
      this.color});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    description = json['description'];
    photo = json['photo'];
    quantity = json['quantity'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['quantity'] = this.quantity;
    data['color'] = this.color;
    return data;
  }
}