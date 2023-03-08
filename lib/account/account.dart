import 'package:MusicPlayer/phone/otp.dart';
import 'package:flutter/material.dart';

import 'package:MusicPlayer/login//login.dart';
import 'package:MusicPlayer/signup//signup.dart';

void main() => runApp(Account());

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodify',
      theme: ThemeData(
        primaryColor: const Color(0xFF210055),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF210055),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enjoy emotions with Moodify',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Center(
                    child: Container(
                      color: const Color(0xFF421d6f),
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.8,
                        maxHeight: constraints.maxWidth * 0.8,
                        minHeight: constraints.maxWidth * 0.8,
                        minWidth: constraints.maxWidth * 0.8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: const Text('Sign-up Free'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(300),
                                ),
                                primary: const Color(0xFF210055),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => otpApp(),
                                  ),
                                );
                              },
                              child: const Text('Continue with Phone number'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                primary: const Color(0xFF210055),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginApp(),
                                  ),
                                );
                              },
                              child: const Text('Log in'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                primary: const Color(0xFF210055),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
