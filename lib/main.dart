import 'dart:async';

// import 'manual.dart';
import 'package:flutter/material.dart';

import 'package:MusicPlayer/account/account.dart';
// import 'package:flutter/services.dart';
// import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'My App',
      home: SplashPage(),
      routes: {
        AppRoutes.account: (context) => Account(),
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
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF021D7C), Color(0xFF000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
      child: Center(
        child: Image.asset('images/logo.png'),
      ),
    )
    );
  }
}
