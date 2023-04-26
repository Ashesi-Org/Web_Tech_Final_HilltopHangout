import 'package:flutter/material.dart';
import 'input_field.dart';


//This file has the Column for the Ashesi details fields of the register page
class AshesiDetails extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController majorController;
  final TextEditingController yearGroupController;
  final TextEditingController campusResidenceController;

  const AshesiDetails({
    Key? key,
    required this.idController,
    required this.majorController,
    required this.yearGroupController,
    required this.campusResidenceController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
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
              if (value == null || value.isEmpty) {
                return 'Please fill this in';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 201, 183),
                ),
              ),
              labelText: 'Campus Residence',
              prefixIcon: Icon(
                Icons.house,
                size: 20,
                color: Color.fromARGB(255, 0, 201, 183),
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
              campusResidenceController.text = value!;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
