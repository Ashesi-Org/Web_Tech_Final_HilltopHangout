import 'package:flutter/material.dart';
import 'home.dart';
import 'widgets/input_field.dart';
import 'register.dart';
import 'user.dart';
import 'feed.dart';
import 'globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);
  

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  
    
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
    Future<void> _login() async {
    final email = _emailController.text.trim();
    final id = _idController.text.trim();

    final usersRef = await FirebaseFirestore.instance.collection('users_data');
    final snapshot = await usersRef.where('email', isEqualTo: email).where('user_id', isEqualTo: id).get();

    if (snapshot.docs.isEmpty) {
      // User not found in database
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or id.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // User found in database
      final userData = snapshot.docs.first.data();
      final user = User(full_name: userData['full_name'],
       email: userData['email'], 
       id: userData['user_id'], 
       dob: userData['dob'], 
       major: userData['major'],
       campus_residence: userData['campus_residence'], 
       fav_food:userData['fav_food'],
       fav_movie: userData['fav_movie'],
       year_group: userData['year_group'] );

      // Set user as logged in
      setState(() {
        loggedInUser = user;
      });

      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FeedPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 0, 201, 183), Color.fromARGB(255, 243, 254, 252)],
            stops: [0.5, 0.5],
          ),
        ),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'images/logo.png',
                    height: 150,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 450,
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Home Page')),
                              );
                            },
                            child: Text(
                              '< Home',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 201, 183),
                                fontSize: 20, 
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Hello Again!',
                            style: TextStyle(fontSize: 33),
                          ),
                        ),
                        SizedBox(height: 30),

                        Form(
                          key: _formKey,
                          child:Column(
                          children: [
                            Container(
                              width: 270,
                              height: 60,
                              child: CustomTextField(
                                controller: _emailController,
                                hintText: 'Enter your Email',
                                icon: Icons.email,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 270,
                              height: 60,
                              child: CustomTextField(
                                controller: _idController,
                                hintText: 'Enter your ID',
                                icon: Icons.numbers,
                              ),
                            ),
                            SizedBox(height: 25,),
                            ElevatedButton(
                              onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _login();
                                      }
                                    },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                backgroundColor: Color.fromARGB(255, 134, 0, 123),
                              ),
                            ),
                          ],
                        ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New Here?',
                               style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterPage()),
                                  );
                                },
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 201, 183),
                                    fontSize: 18, 
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
         
      ),
    );
  }
}