import 'package:flutter/material.dart';
import 'input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalDetails extends StatelessWidget {
  String email = "";
  String dob = "";
  String fav_food ="";
  String fav_movie ="";

  late TextEditingController dobController ;
  late TextEditingController emailController;
  late TextEditingController favFoodController;
  late TextEditingController favMovieController;


  @override
  Widget build(BuildContext context) {
    return Column(
      // children: [
      //   SizedBox(height: 13,),
      //   Container(
      //     padding: EdgeInsets.symmetric(horizontal: 30),
      //     child: Text(
      //       'Personal details',
      //       style: TextStyle(fontSize: 25),
      //     ),
      //   ),
      //   SizedBox(height: 20,),
      //   Container(
      //     width: 270,
      //     height: 60,
      //     child: CustomTextField(
      //       hintText: 'Enter your Email',
      //       icon: Icons.email,
      //       enabled: false,
      //     ),
      //   ),
      //   SizedBox(height: 20,),
      //   Container(
      //     width: 270,
      //     height: 60,
      //     child: CustomTextField(
      //       hintText: 'Enter your Date of Birth',
      //       icon: Icons.date_range,
      //     ),
      //   ),
      //   SizedBox(height: 20,),
      //   Container(
      //     width: 270,
      //     height: 60,
      //     child: CustomTextField(
      //       hintText: 'Enter your Favourite Food',
      //       icon: Icons.restaurant,
      //     ),
      //   ),
      //   SizedBox(height: 20,),
      //   Container(
      //     width: 270,
      //     height: 60,
      //     child: CustomTextField(
      //       controller: _favMovieController,
      //       hintText: 'Enter your Favourite Movie',
      //       icon: Icons.live_tv,
      //     ),
      //   ),
      //   SizedBox(height: 20,),
      // ],
    );
  }
}
