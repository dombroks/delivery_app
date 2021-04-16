import 'dart:ffi';

import 'package:delivery/data/Repository.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends ChangeNotifier {
  Repository repository = Repository.getInstance();
  Future<void> getCommands() => repository.getCommands();
  Future<void> acceptCommand() => repository.acceptCommand();
}
