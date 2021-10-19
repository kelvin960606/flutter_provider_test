import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_with_provider/services/api_service.dart';
import 'package:get/get.dart';

class InitializeService {
  void init() async {
    await Firebase.initializeApp();
    ApiService apiService = Get.put(ApiService());
    apiService.init();
  }
}
