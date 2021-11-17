import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_with_provider/constants/value.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogined = false;
  bool isLoginLoading = false;
  String loginToken = '';
  final storage = new FlutterSecureStorage();

  void updateLoginLoading(v) {
    isLoginLoading = v;
    notifyListeners();
  }

  void updateLoginStatus(v) {
    isLogined = v;
    notifyListeners();
  }

  void updateToken(String v) {
    storage.write(key: STORAGE_LOGIN_KEY, value: v.isNotEmpty ? v : '');
    loginToken = v;
    notifyListeners();
  }

  void setLogin(v) {
    updateLoginStatus(true);
    updateToken(v);
  }

  void setLogout() {
    updateLoginStatus(false);
    updateToken('');
  }

  Future login() async {
    updateLoginLoading(true);
    Future.delayed(Duration(seconds: 1), () {
      updateLoginLoading(false);
      setLogin('asdasjdghskjadkashdasd');
      Get.toNamed('/home');
      Get.showSnackbar(GetBar(
        title: "Authentication",
        message: "Login Successfully",
        duration: Duration(seconds: 3),
      ));
    });
  }

  Future logout() async {
    updateLoginLoading(true);
    Future.delayed(Duration(seconds: 1), () {
      updateLoginLoading(false);
      setLogout();
      Get.toNamed('/login');
      Get.showSnackbar(GetBar(
        title: "Authentication",
        message: "Logout Successfully",
        duration: Duration(seconds: 3),
      ));
    });
  }
}
