import 'package:flutter/material.dart';
import 'input_field.dart';

class PersonalDetails extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController dobController;
  final TextEditingController favFoodController;
  final TextEditingController favMovieController;

  const PersonalDetails({
    Key? key,
    required this.emailController,
    required this.dobController,
    required this.favFoodController,
    required this.favMovieController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 13,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
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
            hintText: 'Enter your Favourite Movie',
            icon: Icons.live_tv,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
