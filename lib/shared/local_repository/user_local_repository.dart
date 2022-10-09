import 'dart:convert';

import 'package:pintando_carro/models/user.dart';
import 'package:hive/hive.dart';

class UserLocalRepository {
  static void setUser({required User user}) {
    final userBox = Hive.box('user');
    userBox.put('user_key', user.toJson());
  }

  static User? getUser() {
    final userBox = Hive.box('user').toMap();
    if (userBox.isEmpty) {
      return null;
    }
    var json = jsonEncode(userBox['user_key']);
    return User.fromJson(jsonDecode(json));
  }

  static clearUser() {
    Hive.box('user').clear();
  }
}
