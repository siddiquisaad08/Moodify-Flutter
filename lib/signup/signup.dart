import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'password.dart';
String name;
String email;
void main() => runApp(SignUp());

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final _auth = FirebaseAuth.instance;
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
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF253D70), Color(0xFF181059)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Your Name',
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
                    name = value;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Saad Siddiqui',
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
                  'Your Email',
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
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'example123@gmail.com',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                  // _auth.createUserWithEmailAndPassword(email: email, password: pass)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pwd(),
                      ),
                    );
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF210055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
