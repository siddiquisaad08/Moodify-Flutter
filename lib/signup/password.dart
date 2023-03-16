import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:MusicPlayer/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(pwd());
}
class pwd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: pwdScreen(),
    );
  }
}

class pwdScreen extends StatefulWidget {
  @override
  _pwdScreenState createState() => _pwdScreenState();
}

class _pwdScreenState extends State<pwdScreen> {
  final _auth = FirebaseAuth.instance;
  String password;
  String confirmPassword;

  bool passwordsMatch() {
    return password == confirmPassword;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF210055),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            color: Color(0xFF421d6f),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value){
                    password = value;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value){
                    confirmPassword = value;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm your password',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    if (passwordsMatch()) {
                      // print(name);
                      // print(email);
                      // print(password);
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        User user = newUser.user;
                        user.updateDisplayName(name);
                        if (newUser != null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginApp(),
                            ),
                          );
                        }
                      }
                      catch (e) {
                        print(e);
                      }
                    } else {
                      // display error message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Passwords do not match"),
                            actions: [
                              TextButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Sign-up'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF210055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
