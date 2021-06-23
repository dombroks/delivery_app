import 'package:delivery/data/repository/Repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  Repository _repository = Repository.getInstance();
  Future<String> login(username, password) =>
      _repository.login(username, password);

  Future<String> register(username, password, phone, email) =>
      _repository.register();

  Future changePassowrd(username, password, phone, email) =>
      _repository.changePassowrd();

  Future resendActivationCode() => _repository.resendActivationCode();
  Future confirmSentCode(code) => _repository.confirmSentCode(code);
  Future logout() => _repository.logout();
}
