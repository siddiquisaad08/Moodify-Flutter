import 'package:flutter/material.dart';
import 'detect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainDetect());
}

class MainDetect extends StatelessWidget {
  const MainDetect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: const Detect(),
    );
  }
}
