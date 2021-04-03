import 'package:delivery/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {
  Future<String> getTodos() async {
    var response = await http.get('${baseUrl}accounts/profiles/');
    return response.body;
  }
}
