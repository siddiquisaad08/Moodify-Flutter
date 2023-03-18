import 'package:MusicPlayer/phone/otpsubmit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MusicPlayer/Home/home.dart';
import 'package:MusicPlayer/phone/otpsubmit.dart';

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
  final _phoneController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String _verificationId = "";

  void _sendOTP() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        codeSent: (String verificationId, int resendToken) {
          // Save the verification ID so that it can be used in the next screen
          setState(() {
            _verificationId = verificationId;
            otpSent = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto retrieval timeout
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      print(e.toString());
    }
  }

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
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
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
                  onPressed: () async {
                    _sendOTP();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => otpSubmit(),
                      ),
                    );
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
            ],
          ),
        ),
      ),
    );
  }
}