import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  User? user;

  void signup({required String username, required String password}) async {
    token = await AuthServices().Signup(username: username, password: password);

    notifyListeners();
  }

  void signin({required String username, required String password}) async {
    token = await AuthServices().Signin(username: username, password: password);
    user = User.fromJson(Jwt.parseJwt(token));
    print(token);
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty) {
      user = User.fromJson(Jwt.parseJwt(token));
      return true;
    }
    return false;
  }

  void signout() {
    token = "";
    this.user = null;
    notifyListeners();
  }
}
