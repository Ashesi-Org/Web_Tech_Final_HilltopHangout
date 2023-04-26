import 'package:flutter/material.dart';
import 'package:web_tech_final_flutter/home.dart';
import 'package:web_tech_final_flutter/feed.dart';
import 'package:web_tech_final_flutter/profile.dart';

class FeedSideMenu extends StatelessWidget {
  const FeedSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 26),
        Center(
          child: Image.asset(
            'images/logo_white_bg.png',
            height: 100,
          ),
        ),
        SizedBox(height: 36),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'Home Page'),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Color.fromARGB(255, 0, 201, 183)),
              SizedBox(width: 10),
              Text(
                'Home',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 201, 183),
                  fontSize: 25,
                ),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
        SizedBox(height: 23),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FeedPage(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat, color: Color.fromARGB(255, 134, 0, 123)),
              SizedBox(width: 10),
              Text(
                'Feed',
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 0, 123),
                  fontSize: 25,
                ),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
        SizedBox(height: 23),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Color.fromARGB(255, 0, 201, 183)),
              SizedBox(width: 10),
              Text(
                'Profile',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 201, 183),
                  fontSize: 25,
                ),
              ),
            ],
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
      ],
    );
  }
}
