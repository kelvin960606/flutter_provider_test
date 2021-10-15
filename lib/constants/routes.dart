import 'package:flutter_with_provider/pages/home_page.dart';
import 'package:flutter_with_provider/pages/login_page.dart';
import 'package:get/get.dart';

var routes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/home', page: () => HomePage()),
];
