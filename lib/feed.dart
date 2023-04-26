import 'package:flutter/material.dart';
import 'widgets/feed_input_field.dart';
import 'widgets/input_field.dart';
import 'widgets/feed_side_menu.dart';
import 'future_functions.dart';
import 'widgets/posts_stream.dart';
import 'widgets/people_stream.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedState();
}

class _FeedState extends State<FeedPage> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  final _postEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(40, 0, 201, 183),
              Color.fromARGB(40, 212, 73, 236),
              Color.fromARGB(40, 215, 228, 227)
            ],
            stops: [0.3, 0.6, 1],
          ),
        ),
        child: Stack(
          children: [
            Material(
              elevation: 4, // Set the elevation to 4
              child: Container(
                height: double.infinity,
                width: 255,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: FeedSideMenu(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Material(
                elevation: 4,
                child: Container(
                  height: double.infinity,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Discover new people',
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        child: PeopleWidget(),
                      ),
                    ),
                  ]
                      // Add your widgets here
                      ),
                ),
              ),
            ),
            Center(
              child: Transform.translate(
                offset: Offset(-18, -300),
                child: Container(
                  height: 130,
                  width: 490,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('images/feed.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 130, left: 133),
              child: Container(
                width: 1000,
                child: Column(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 650,
                      height: 150,
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Form(
                          key: _formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 310,
                                height: 100,
                                child: PostCustomTextField(
                                  controller: _commentController,
                                  hintText: "What's on your mind...",
                                  icon: Icons.person,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    child: CustomTextField(
                                      controller: _postEmailController,
                                      hintText: 'Enter your Email',
                                      icon: Icons.email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Map<String, dynamic> comment = {
                                          'email': _postEmailController.text,
                                          'text': _commentController.text,
                                        };
                                        postComment(comment);
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Comment made successfully!',
                                                style: TextStyle(fontSize: 28),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    _commentController.clear();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Share Post',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      backgroundColor:
                                          Color.fromARGB(255, 134, 0, 123),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 650,
                        child: FeedWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
