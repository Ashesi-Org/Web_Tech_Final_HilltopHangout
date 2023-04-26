import 'package:flutter/material.dart';
import 'package:web_tech_final_flutter/widgets/ashesi_details.dart';
import 'home.dart';
import 'login.dart';
import 'widgets/input_field.dart';
import 'widgets/personal_details.dart';
import 'future_functions.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _favFoodController = TextEditingController();
  final _favMovieController = TextEditingController();
  final _idController = TextEditingController();
  final _majorController = TextEditingController();
  final _yearGroupController = TextEditingController();
  final _campusResidenceController = TextEditingController();


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
              Color.fromARGB(255, 0, 201, 183),
              Color.fromARGB(255, 243, 254, 252)
            ],
            stops: [0.5, 0.5],
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
                  child: Image.asset(
                    'images/logo.png',
                    height: 150,
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
                                  builder: (context) =>
                                      MyHomePage(title: 'Home Page'),
                                ),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 30),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Join the community!',
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
                                  controller: _nameController,
                                  hintText: 'Enter your name',
                                  icon: Icons.person,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  PersonalDetails( emailController: _emailController,
                                    dobController: _dobController,
                                    favFoodController: _favFoodController,
                                    favMovieController: _favMovieController,),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    height: 280,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 134, 0, 123),
                                      thickness: 0.8,
                                    ),
                                  ),
                                  AshesiDetails( idController: _idController,
                                    majorController: _majorController,
                                    yearGroupController: _yearGroupController,
                                    campusResidenceController: _campusResidenceController,),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Map<String, dynamic> user = {
                                    'full_name': _nameController.text,
                                    'email': _emailController.text,
                                    'user_id': _idController.text,
                                    'dob': _dobController.text,
                                    'major': _majorController.text,
                                    'campus_residence': _campusResidenceController.text,
                                    'year_group': _yearGroupController.text,
                                    'fav_food': _favFoodController.text,
                                    'fav_movie': _favMovieController.text,
                                  };
                                  postUser(user);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Signup successful! Login to continue', style: TextStyle(fontSize: 30),),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => LoginPage()),
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
                                  'Signup',
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
                            'Already part of the community?',
                             style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(
                                'Login',
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
      ),
    );
  }
}