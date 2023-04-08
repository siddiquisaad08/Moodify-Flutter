import 'package:flutter/material.dart';
import 'package:MusicPlayer/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp.dart';

void main() => runApp(otpSubmit());

class otpSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'otp',
      home: submitScreen(),
    );
  }
}

class submitScreen extends StatefulWidget {
  @override
  _submitScreenState createState() => _submitScreenState();
}

class _submitScreenState extends State<submitScreen> {
  bool otpSent = false;
  bool isCorrectOTP = false;
  final _auth = FirebaseAuth.instance;
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  String _verificationId = "";

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
          height: MediaQuery.of(context).size.width * 0.8,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    child: TextFormField(
                      controller: _otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index != 5) {
                          // focus to the next field
                          FocusScope.of(context).nextFocus();
                        } else if (value.length == 0 && index != 0) {
                          // focus to the previous field
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    String otp = "";
                    _otpControllers.forEach((controller) {
                      otp += controller.text.trim();
                    });
                    try {
                      final credential = PhoneAuthProvider.credential(
                        verificationId: _verificationId,
                        smsCode: otp,
                      );
                      await FirebaseAuth.instance.signInWithCredential(
                          credential);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text('Submit'),
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
