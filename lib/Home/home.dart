import 'song.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'manual.dart';
import 'package:firebase_core/firebase_core.dart';
void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.displayName);
      }
    } catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF210055),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Welcome ${loggedInUser?.email ?? "Guest"}!'),
        // title: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.white.withOpacity(0.3),
        //   ),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       hintText: 'Search',
        //       hintStyle: TextStyle(color: Colors.white),
        //       icon: Icon(
        //         Icons.search,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            color: Colors.transparent,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(
                //   //   builder: (context) => CameraPage(cameras),
                //   // ),
                // );
              },
              child: Text('Face Recognize'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            color: Colors.transparent,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => manual(),
                  ),
                );
              },
              child: Text('Manual Select'),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongPage(),
            ),
          );
        },
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/id/237/200/300',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Song Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Artist Name',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
