class User {
  int id;
  String name;
  String lastName;
  String userName;
  String emailAddress;
  String password;
  String phone;
  

  User(
      {this.id,
      this.name,
      this.lastName,
      this.userName,
      this.emailAddress,
      this.password,
      this.phone,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    password = json['password'];
    phone = json['phone'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['emailAddress'] = this.emailAddress;
    data['password'] = this.password;
    data['phone'] = this.phone;
    
    return data;
  }
}
