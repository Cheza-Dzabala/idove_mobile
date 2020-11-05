import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorageService {
  final storage = new FlutterSecureStorage();

  Future<String> getUserData() async {
    var userData = await storage.read(key: 'user_data');
    return userData;
  }

  setUserData(String data) async {
    await storage.write(key: 'user_data', value: data);
  }

  clearUserData() async {
    await storage.deleteAll();
  }

  Future<String> getFirstName() async {
    var userData = await storage.read(key: 'user_data');
    Map<String, dynamic> data = jsonDecode(userData);
    return data['user_data']['first_name'];
  }
}
