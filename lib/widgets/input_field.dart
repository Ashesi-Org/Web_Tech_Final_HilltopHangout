import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool enabled;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
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
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        labelText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          size: 20,
          color: Color.fromARGB(255, 0, 201, 183),
        ),
      ),
    );
  }
}
