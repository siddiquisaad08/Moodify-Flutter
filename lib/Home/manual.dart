import 'package:flutter/material.dart';
import 'package:MusicPlayer/Home/youtube/screens/home_screen.dart';
List<String> emotion = ['happiness','sadness', 'neutral', 'anger', 'surprise'];
void main() {
  runApp(manual());
}

class manual extends StatelessWidget {
  final List<String> emojis = [
    '😀',
    '🙂',
    '😭',
    '😤',
    '😲'
  ]; // list of emojis to display

  final List<Function(BuildContext)> functions = [
        (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen2(emotion[0]),
              ),
          );// Navigate to a new screen when this button is pressed // Replace this with your own functionality
    },
        (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen2(emotion[2]),
            ),
          ); // Replace this with your own functionality
    },
        (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen2(emotion[1]),
            ),
          );
    },
        (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen2(emotion[3]),
            ),
          ); // Replace this with your own functionality
    },
        (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen2(emotion[4]),
            ),
          ); // Replace this with your own functionality
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Grid',
      home: Scaffold(
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF021D7C), Color(0xFF000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: emojis.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // display 2 emojis per line
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1, // set aspect ratio of each grid item
          ),
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  functions[index](context); // Call the appropriate function for the button
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // set button background color
                    shape: BoxShape.circle, // make button circular
                  ),
                  padding: EdgeInsets.all(20), // increase button size
                  child: Text(
                    emojis[index],
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    )
    );
  }
}
