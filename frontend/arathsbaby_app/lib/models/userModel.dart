class User {
  int id;
  String name;
  String lastName;
  String userName;
  String emailAddress;
  String password;
  String phone;
  String address;
  String colony;
  String street;
  String outsideNumber;
  String internalNumber;
  String city;
  String zipCode;
  String state;
  String country;

  User(
      {this.id,
      this.name,
      this.lastName,
      this.userName,
      this.emailAddress,
      this.password,
      this.phone,
      this.address,
      this.colony,
      this.street,
      this.outsideNumber,
      this.internalNumber,
      this.city,
      this.zipCode,
      this.state,
      this.country});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    colony = json['colony'];
    street = json['street'];
    outsideNumber = json['outsideNumber'];
    internalNumber = json['internalNumber'];
    city = json['city'];
    zipCode = json['zipCode'];
    state = json['state'];
    country = json['country'];
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
    data['address'] = this.address;
    data['colony'] = this.colony;
    data['street'] = this.street;
    data['outsideNumber'] = this.outsideNumber;
    data['internalNumber'] = this.internalNumber;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}
