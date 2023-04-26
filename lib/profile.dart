import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'globals.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_side_menu.dart';
import 'widgets/posts_stream_individual.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  Future<void> _updateLoginUser() async {
    final usersRef = await FirebaseFirestore.instance.collection('users_data');
    final snapshot =
        await usersRef.where('user_id', isEqualTo: loggedInUser!.id).get();

    if (snapshot.docs.isEmpty) {
      // User not found in database
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Failed'),
            content: Text('User not found.'),
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
      final user = User(
          full_name: userData['full_name'],
          email: userData['email'],
          id: userData['user_id'],
          dob: userData['dob'],
          major: userData['major'],
          campus_residence: userData['campus_residence'],
          fav_food: userData['fav_food'],
          fav_movie: userData['fav_movie'],
          year_group: userData['year_group']);

      setState(() {
        loggedInUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateLoginUser();
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 201, 183),
              Color.fromARGB(255, 212, 73, 236),
              Color.fromARGB(255, 215, 228, 227)
            ],
            stops: [0.03, 0.3, 0.3],
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
                  child: ProfileSideMenu()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 190, left: 255),
              child: Container(
                height: 20,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Center(
              child: Transform.translate(
                offset: Offset(120, -200),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('images/profile.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 235, left: 312),
              child: Container(
                height: 435,
                width: 1000,
                child: Row(
                  children: [
                    SizedBox(
                      width: 450,
                      height: 435,
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          child: Column(children: [
                            Text(
                              loggedInUser!.full_name,
                              style: TextStyle(
                                  fontSize: 33,
                                  color: Color.fromARGB(255, 134, 0, 123)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              loggedInUser!.email,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(height: 5),
                            Text(
                              loggedInUser!.id,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Date of Birth: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.dob,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Year Group: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.year_group,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.class_,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Major: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.major,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.house,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Campus Residence: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.campus_residence,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.restaurant,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Favourite Food: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.fav_food,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.live_tv,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    text: 'Favourite Movie: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loggedInUser!.fav_movie,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 134, 0, 123),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  iconSize: 30,
                                  icon: const Icon(Icons.edit,
                                      color: Color.fromARGB(255, 134, 0, 123)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage()),
                                    );
                                  },
                                ),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(children: [
                      Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 450,
                          child: Text(
                            'My Posts',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 450,
                          child: indivPostFeed(),
                        ),
                      )
                    ]),
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
