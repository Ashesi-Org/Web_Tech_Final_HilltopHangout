import 'package:flutter/material.dart';
import 'profile.dart';
import 'widgets/input_field.dart';
import 'widgets/edit_personal_details.dart';
import 'globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'future_functions.dart';
import 'login.dart';
import 'user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String full_name = "";
  String email = "";
  String dob = "";
  String fav_food = "";
  String fav_movie = "";
  String id = "";
  String major = "";
  String year_group = "";
  String campus_residence = "";
  late TextEditingController idController;
  late TextEditingController majorController;
  late TextEditingController yearGroupController;
  late TextEditingController campusResidenceController;
  late TextEditingController dobController;
  late TextEditingController emailController;
  late TextEditingController favFoodController;
  late TextEditingController favMovieController;
  late TextEditingController nameController;

  void getDetails() async {
    final userData = await FirebaseFirestore.instance
        .collection('users_data')
        .doc(loggedInUser!.id)
        .get();
    setState(() {
      full_name = userData['full_name'];
      id = userData['user_id'];
      major = userData['major'];
      campus_residence = userData['campus_residence'];
      year_group = userData['year_group'];
      email = userData['email'];
      dob = userData['dob'];
      major = userData['major'];
      campus_residence = userData['campus_residence'];
      fav_food = userData['fav_food'];
      fav_movie = userData['fav_movie'];
      year_group = userData['year_group'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    idController = TextEditingController(text: id);
    majorController = TextEditingController(text: major);
    yearGroupController = TextEditingController(text: year_group);
    campusResidenceController = TextEditingController(text: campus_residence);
    dobController = TextEditingController(text: dob);
    emailController = TextEditingController(text: email);
    favFoodController = TextEditingController(text: fav_food);
    favMovieController = TextEditingController(text: fav_movie);
    nameController = TextEditingController(text: full_name);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 134, 0, 123),
              Color.fromARGB(255, 233, 97, 222),
              Color.fromARGB(255, 253, 214, 250)
            ],
            stops: [0.1, 0.5, 0.5],
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
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
                SizedBox(height: 16),
                SizedBox(
                  width: 800,
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
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            },
                            child: Text(
                              '< Profile',
                              style: TextStyle(
                                color: Color.fromARGB(255, 134, 0, 123),
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 33),
                          ),
                        ),
                        SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 270,
                                height: 60,
                                child: CustomTextField(
                                  controller: nameController,
                                  hintText: 'Enter your name',
                                  icon: Icons.person,
                                  enabled: false,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 13,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          'Personal details',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: emailController,
                                          hintText: 'Enter your Email',
                                          icon: Icons.email,
                                          enabled: false,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: dobController,
                                          hintText: 'Enter your Date of Birth',
                                          icon: Icons.date_range,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: favFoodController,
                                          hintText: 'Enter your Favourite Food',
                                          icon: Icons.restaurant,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: favMovieController,
                                          hintText:
                                              'Enter your Favourite Movie',
                                          icon: Icons.live_tv,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    height: 280,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 134, 0, 123),
                                      thickness: 0.8,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          'Ashesi details',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: idController,
                                          hintText: 'Enter your Student ID',
                                          icon: Icons.numbers,
                                          enabled: false,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: yearGroupController,
                                          hintText: 'Enter your Year Group',
                                          icon: Icons.school,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 60,
                                        child: CustomTextField(
                                          controller: majorController,
                                          hintText: 'Enter your Major',
                                          icon: Icons.class_,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 270,
                                        height: 50,
                                        child: DropdownButtonFormField<String>(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please fill this in';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 201, 183),
                                              ),
                                            ),
                                            labelText: 'Campus Residence',
                                            prefixIcon: Icon(
                                              Icons.house,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 0, 201, 183),
                                            ),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("On Campus"),
                                              value: "On Campus",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Off Campus"),
                                              value: "Off Campus",
                                            ),
                                          ],
                                          onChanged: (value) {
                                            campusResidenceController.text= value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfilePage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 134, 0, 123),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Map<String, dynamic> newDetails = {
                                          'full_name': nameController.text,
                                          'email': emailController.text,
                                          'user_id': idController.text,
                                          'dob': dobController.text,
                                          'major': majorController.text,
                                          'campus_residence':
                                              campusResidenceController.text,
                                          'year_group':
                                              yearGroupController.text,
                                          'fav_food': favFoodController.text,
                                          'fav_movie': favMovieController.text,
                                        };
                                        updateUser(newDetails);

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Changes saved!',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProfilePage()),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Save Changes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20),
                                      backgroundColor:
                                          Color.fromARGB(255, 134, 0, 123),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
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
