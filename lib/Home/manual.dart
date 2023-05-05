import 'package:flutter/material.dart';
import 'package:Moodify/Home/youtube/screens/home_screen.dart';

List<String> emotion = ['Happy', 'Neutral', 'Sad', 'Angry', 'Surprise'];
void main() {
  runApp(manual());
}

class manual extends StatefulWidget {
  @override
  State<manual> createState() => _manualState();
}

class _manualState extends State<manual> {
  final List<String> emojis = ['😀', '🙂', '😭', '😤', '😲'];
  // list of emojis to display
  final List<Function(BuildContext)> functions = [
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen2(emotion[0]),
        ),
      ); // Navigate to a new screen when this button is pressed // Replace this with your own functionality
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen2(emotion[1]),
        ),
      ); // Replace this with your own functionality
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen2(emotion[2]),
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
        debugShowCheckedModeBanner: false,
        title: 'Emoji Grid',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3660DC),
            elevation: 0,
            title: Text('Manually Select'),
          ),
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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          functions[index](context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            emojis[index],
                            style: TextStyle(fontSize: 60),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        emotion[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
