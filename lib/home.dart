import 'package:flutter/material.dart';
import '../register.dart';
import '../login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                gradient: const RadialGradient(
                    colors: [Color.fromARGB(255, 0, 201, 183), Color.fromARGB(255, 134, 0, 123)],
                    radius: 5,
                   ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello There!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
                fontFamily: 'TextMeOne',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to",
              style: TextStyle(
                color: Color.fromARGB(255, 134, 0, 123),
                fontSize: 33,
                fontFamily: 'TextMeOne',
              ),
            ),
            SizedBox(height: 18),
            Image.asset(
              'images/logo_no_bg.png',
              height: 200,
            ),
            Text(
              "Experience Ashesi's community spirit online",
              style: TextStyle(
                color: Color.fromARGB(255, 134, 0, 123),
                fontSize: 15,
                fontFamily: 'TextMeOne',
              ),
            ),
            SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'New Here?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 0, 123),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 56),
                Column(
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 0, 123),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
