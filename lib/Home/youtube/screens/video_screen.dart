import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {

  final String id;

  VideoScreen({required this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  late YoutubePlayerController _controller;
  bool _isLiked = false;
  bool _isDisliked = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                color: _isLiked ? Colors.blue : Colors.grey,
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                    if (_isDisliked) _isDisliked = false;
                  });
                },
              ),
              SizedBox(width: 10),
              Text('Like'),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(Icons.thumb_down),
                color: _isDisliked ? Colors.blue : Colors.grey,
                onPressed: () {
                  setState(() {
                    _isDisliked = !_isDisliked;
                    if (_isLiked) _isLiked = false;
                  });
                },
              ),
              SizedBox(width: 10),
              Text('Dislike'),
            ],
          ),
        ],
      ),
    );
  }
}
