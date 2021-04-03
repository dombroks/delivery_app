import 'package:delivery/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {
  Future login(String username, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('GET', Uri.parse('${baseUrl}accounts/profiles/'));
    request.bodyFields = {
      'username': username,
      'password': password,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("successful login");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future register(
      String username, String password, String phone, String email) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('POST', Uri.parse('${baseUrl}accounts/users/register/'));
    request.bodyFields = {
      'username': username,
      'password': password,
      'user_type': 'A',
      'phone': phone,
      'email': email
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("successful registering");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future changePassowrd(
      String username, String password, String phone, String email) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('PATCH', Uri.parse('${baseUrl}accounts/users/2/'));
    request.bodyFields = {'password': 'password'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("password has been changed");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future logout() {}
}
