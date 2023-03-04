import 'package:MusicPlayer/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(otpApp());

class otpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'otp',
      home: otpScreen(),
    );
  }
}

class otpScreen extends StatefulWidget {
  @override
  _otpScreenState createState() => _otpScreenState();
}
class _otpScreenState extends State<otpScreen> {
  bool otpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF210055),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 1,
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
                  'Enter Phone Number',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '+919076162529',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      otpSent = true;
                    });
                    // add code to send OTP here
                  },
                  child: Text('Send OTP'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF210055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'OTP',
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
                  enabled: otpSent,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your OTP',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Text('Submit'),
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
