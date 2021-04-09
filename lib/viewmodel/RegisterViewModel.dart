import 'dart:convert';
import 'dart:io';

import 'package:delivery/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

class RegisterViewModel extends ChangeNotifier {
  File _file;
  var data = {
    'username': 'wassimee',
    'password': 'password',
    'user_type': 'D',
    'phone': '+213799136338',
    'email': 'tester@test.com',
  };

  chooseImage() {
    _file = ImagePicker().getImage(source: ImageSource.gallery) as File;
  }

  getImage() {
    return _file;
  }

  convertImageToBase64(File file) {
    return base64Encode(file.readAsBytesSync()).toString();
  }

  Future register() {
    var request =
        http.Request('POST', Uri.parse(baseUrl + "accounts/users/register/"));
  }
}
