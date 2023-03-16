import 'package:flutter/material.dart';

void main() => runApp(SongPage());

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF210055),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.rowing),
                color: Colors.white,
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_arrow),
                color: Colors.white,
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.pause),
                color: Colors.white,
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.forward),
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  '0:00',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: 0.5,
                    onChanged: (value) {},
                    inactiveColor: Colors.grey,
                    activeColor: Colors.white,
                  ),
                ),
                Text(
                  '3:12',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
