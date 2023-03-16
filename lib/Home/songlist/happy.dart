import 'package:flutter/material.dart';
import 'package:MusicPlayer/Home/song.dart';
void main() => runApp(HSongList());

class HSongList extends StatelessWidget {
  final List<String> songs = ['Song 1', 'Song 2', 'Song 3'];
  final List<Function(BuildContext)> functions = [
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ),
      ); // Navigate to a new screen when this button is pressed // Replace this with your own functionality
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ),
      ); // Replace this with your own functionality
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ),
      );
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ),
      ); // Replace this with your own functionality
    },
        (BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ),
      ); // Replace this with your own functionality
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Mood',
      home: Scaffold(
        backgroundColor: const Color(0xFF210055),
        appBar: AppBar(
          title: Text('Happy Mood'),
        ),
        body: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: GestureDetector(
                onTap: () {
                  functions[index](context);
                },
                child: Text(
                    songs[index],
                    style: TextStyle(color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}
