import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_with_provider/constants/value.dart';
import 'package:flutter_with_provider/providers/auth_provider.dart';
import 'package:flutter_with_provider/services/api_service.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class InitializeService {
  void init() async {
    await Firebase.initializeApp();
    ApiService apiService = Get.put(ApiService());
    apiService.init();
  }

  void initAuthService(BuildContext context) async {
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: STORAGE_LOGIN_KEY);
    if (value != null && value.isNotEmpty) {
      Provider.of<AuthProvider>(context, listen: false).setLogin(value);
    }
  }
}
