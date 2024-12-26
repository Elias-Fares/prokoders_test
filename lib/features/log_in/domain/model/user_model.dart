

class UserModel {
  String name;
  String email;
  String id;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
  });
}

class UserManager {
  static final UserManager _instance = UserManager._internal();
  UserManager._internal();
  factory UserManager() {
    return _instance;
  }
  UserModel? _user;
  UserModel? get user => _user;
  void setUser(UserModel user) {
    _user = user;
  }

  void clearUser() {
    _user = null;
  }
}


