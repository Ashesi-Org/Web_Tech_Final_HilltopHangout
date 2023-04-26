import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_packages.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'profile_side_menu.dart';



class OtherProfilePage extends StatelessWidget {
  final User userProfile;

  const OtherProfilePage({Key? key, required this.userProfile}) : super(key: key);

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
          child: ProfileSideMenu()
        ),
      ),
        Padding(padding: EdgeInsets.only(top: 190, left: 255), 
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
        Padding(padding: EdgeInsets.only(top: 235, left: 282), 
        child: Container(
          height: 435,
          width: 1000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox( width:450,height: 435,
                child:Card(elevation: 4, color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  
                  child: Column(children: [
                    Text('${userProfile.full_name}',
                      style: TextStyle(
                        fontSize: 33, color: Color.fromARGB(255, 134, 0, 123)), 
                        ),
                    SizedBox(height: 5),
                    Text('${userProfile.email}',style: TextStyle(
                        fontSize: 16, color: Colors.black, fontStyle: FontStyle.italic,letterSpacing: 1.5),
                        ),
                    SizedBox(height: 5),
                    Text('${userProfile.id}',style: TextStyle(
                        fontSize: 16,),
                        ),
                    SizedBox(height: 18),
                    Row(children:[
                        Icon(Icons.date_range, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Date of Birth: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.dob}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children:[
                        Icon(Icons.school, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Year Group: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.year_group}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children:[
                        Icon(Icons.class_, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Major: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.major}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children:[
                        Icon(Icons.house, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Campus Residence: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.campus_residence}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children:[
                        Icon(Icons.restaurant, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Favourite Food: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.fav_food}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(children:[
                        Icon(Icons.live_tv, color: Colors.black,size: 18,),
                        SizedBox(width: 10),
                        Text.rich(TextSpan(
                            text: 'Favourite Movie: ',
                            style: TextStyle( fontSize: 15,),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${userProfile.fav_movie}',
                                style: TextStyle( color: Color.fromARGB(255, 134, 0, 123),fontSize: 18,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
          
                  ]),
                ),
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