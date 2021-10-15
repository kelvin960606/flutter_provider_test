import 'package:firebase_core/firebase_core.dart';

class InitializeService {
  void init() async {
    await Firebase.initializeApp();
  }
}
