import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/services/storage/user_storage_service.dart';
import 'package:idove/utilities/Constants.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  UserStorageService _userStorageService = locator<UserStorageService>();

  Future<int> login({@required String email, @required String password}) async {
    const url = '$BACKEND_URL/login';
    print(url);
    var response = await http.post(
      url,
      body: {'email': email, 'password': password},
      headers: APPLICATION_HEADERS,
    );
    if (response.statusCode == 200) {
      await _userStorageService.setUserData(response.body);
    }
    return response.statusCode;
  }
}
