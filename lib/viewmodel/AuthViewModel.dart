import 'package:delivery/data/repository/Repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  Repository _repository = Repository();
  Future<String> login(username, password) =>
      _repository.login(username, password);

  Future<String> register(username, password, phone, email) =>
      _repository.register(username, password, phone, email);

  Future changePassowrd(username, password, phone, email) =>
      _repository.changePassowrd(username, password, phone, email);

  Future logout() => _repository.logout();
}
