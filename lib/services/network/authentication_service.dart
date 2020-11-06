import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/services/storage/user_storage_service.dart';
import 'package:idove/utilities/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:idove/utilities/strings/errorBuilder.dart';

class AuthenticationService {
  UserStorageService _userStorageService = locator<UserStorageService>();

  Future<int> login({@required String email, @required String password}) async {
    const url = '$BACKEND_URL/login';
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

  Future<Map<String, String>> register(
      {@required String firstName,
      @required String lastName,
      @required email,
      @required String userName,
      @required password,
      @required passwordConfirmation}) async {
    const url = '$BACKEND_URL/register';

    var response = await http.post(
      url,
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'username': userName,
        'password': password,
        'password_confirmation': passwordConfirmation
      },
      headers: APPLICATION_HEADERS,
    );

    Map<String, dynamic> response_map = jsonDecode(response.body);

    if (response.statusCode != 201) {
      if (response_map.containsKey('errors')) {
        String errorBody = buildErrors(response_map);
        Map<String, String> callResponse = {
          'statusCode': response.statusCode.toString(),
          'error': errorBody
        };
        return callResponse;
      } else {
        return {
          'statusCode': response.statusCode.toString(),
          'error':
              'Something we terribly wrong on our end. Please try again shortly. '
        };
      }
    }
    if (response.statusCode == 201) {
      return {
        'statusCode': response.statusCode.toString(),
        'message': response_map['message']
      };
    }
//    print(response.statusCode);
  }
}
