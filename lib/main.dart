import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_provider/providers/index.dart';
import 'package:flutter_with_provider/services/initialize_service.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'components/authenticate.dart';
import 'constants/routes.dart';
import 'constants/value.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitializeService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        title: 'Flutter Provider Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          //     .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        getPages: routes,
        home: InitPage(),
      ),
    );
  }
}

class InitPage extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    InitializeService().initAuthService(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Firebase is something went wrong');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Authenticate();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
