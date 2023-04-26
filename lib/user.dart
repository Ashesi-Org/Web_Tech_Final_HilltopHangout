import 'package:flutter/material.dart';

class User {
  final String full_name;
  final String email;
  final String dob;
  final String fav_food;
  final String fav_movie;
  final String id;
  final String major;
  final String year_group;
  final String campus_residence;

  User(
      {required this.full_name,
      required this.email,
      required this.dob,
      required this.fav_food,
      required this.fav_movie,
      required this.id,
      required this.major,
      required this.year_group,
      required this.campus_residence});
}
