import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogined = false;

  Future login() async {
    Future.delayed(Duration(seconds: 1), () {
      isLogined = true;
      Get.showSnackbar(GetBar(
        title: "Authentication",
        message: "Login Successfully",
        duration: Duration(seconds: 3),
      ));
      Get.toNamed('/home');
      notifyListeners();
    });
  }

  Future logout() async {
    Future.delayed(Duration(seconds: 1), () {
      isLogined = false;
      Get.showSnackbar(GetBar(
        title: "Authentication",
        message: "Logout Successfully",
        duration: Duration(seconds: 3),
      ));
      Get.toNamed('/login');
      notifyListeners();
    });
  }
}
