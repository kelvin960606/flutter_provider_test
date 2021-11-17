import 'package:flutter/material.dart';
import 'package:flutter_with_provider/pages/home_page.dart';
import 'package:flutter_with_provider/pages/login_page.dart';
import 'package:flutter_with_provider/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AuthProvider>(context).isLogined) {
      return HomePage();
    }
    return LoginPage();
  }
}
