// ignore_for_file: avoid_print

abstract class DataFactory {
  T createFactory<T>(Map<String, dynamic> json);
}

class User {
  final String? id;
  final String? name;
  final String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Product {
  final String? id;
  final String? name;
  final int? price;
  final String? description;

  Product({this.id, this.name, this.price, this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description']);
  }
}

class GenerateDataFactory implements DataFactory {
  @override
  T createFactory<T>(Map<String, dynamic> json) {
    if (T == User) {
      return User.fromJson(json) as T;
    } else if (T == Product) {
      return Product.fromJson(json) as T;
    } else {
      throw Exception("not a type");
    }
  }
}

void main(List<String> args) {
  final dataFactory = GenerateDataFactory();
  final userJson1 = {'id': '1', 'name': 'test1', 'email': 'test@test.com'};
  final userJson2 = {'id': '2', 'name': 'test2', 'email': 'test2@test.com'};
  final productJson1 = {
    'id': '1',
    'name': 'Laptop',
    'price': 500,
    "description": "Short description"
  };
  final productJson2 = {
    'id': '2',
    'name': 'Mobile',
    'price': 200,
    "description": "Short description"
  };

  User user1 = dataFactory.createFactory<User>(userJson1);
  User user2 = dataFactory.createFactory<User>(userJson2);

  print(user1.email);
  print(user2.email);

  Product product1 = dataFactory.createFactory<Product>(productJson1);
  Product product2 = dataFactory.createFactory<Product>(productJson2);

  print(product1.name);
  print(product2.name);
}
