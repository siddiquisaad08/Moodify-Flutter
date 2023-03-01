import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Grid',
      home: Scaffold(
        backgroundColor: Color(0xff210055), // set background color
        body: GridView.builder(
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
              child: ElevatedButton(
                onPressed: () {
                  // do something when button is pressed
                },
                child: Text(
                  emojis[index],
                  style: TextStyle(fontSize: 60),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // set button background color
                  shape: CircleBorder(), // make button circular
                  padding: EdgeInsets.all(20), // increase button size
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
