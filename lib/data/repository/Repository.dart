

class Repository {
  static Repository _instance;

  static Repository getInstance() {
    if (_instance == null) {
      _instance = Repository();
    }
    return _instance;
  }

  Future<String> login(String username, String password) async {
    
  }

  Future register(){}
      
  

  Future changePassowrd(){}
      

  Future<void> resendActivationCode() {}

  Future logout() {}

  Future<void> confirmSentCode(String code) {}

  Future<void> getCommands() {}

  Future<void> acceptCommand() {}
}
