import 'dart:async';
// import 'package:MusicPlayer/firebase_options.dart';

// import 'manual.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'account.dart';
// import 'login.dart';
import 'routes.dart';
void main() {
  // Widgets.FlutterBinding.ensureInitialized();
  // Fireb ase.initializedApp(options: DefaultFirebaseOptions.currentPlatform)
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: SplashPage(),
      routes: {
        AppRoutes.account: (context) => account(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1000), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.account);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff210055),
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
