import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'user.dart';
import 'other_profile.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//A future function to create a user
Future<void> postUser(Map<String, dynamic> user) async {
  final url = 'https://web-tech-final-383311.uc.r.appspot.com/users';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode(user);
  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 201) {
    // Handle successful response
    print(response.body);
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}.');
  }
}

//A future function to get a user using their id, and display their profile
Future<void> getUser(String userId, BuildContext context) async {
  final url = Uri.parse('https://web-tech-final-383311.uc.r.appspot.com/users')
      .replace(queryParameters: {"user_id": userId});
  final headers = {'Content-Type': 'application/json'};
  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // Handle successful response
    final user = jsonDecode(response.body);
    print(user);

    final userProfile = User(
      id: user['user_id'],
      full_name: user['full_name'],
      email: user['email'],
      dob: user['dob'],
      major: user['major'],
      year_group: user['year_group'],
      campus_residence: user['campus_residence'],
      fav_movie: user['fav_movie'],
      fav_food: user['fav_food'],
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtherProfilePage(userProfile: userProfile),
      ),
    );
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}.');
  }
}

//A future function to update a user
Future<void> updateUser(Map<String, dynamic> user) async {
  final url = 'https://web-tech-final-383311.uc.r.appspot.com/users';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode(user);
  final response = await http.put(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Handle successful response
    print(response.body);
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}.');
  }
}
 
//A future function to post comments
Future<void> postComment(Map<String, dynamic> comment) async {
  final url = 'https://web-tech-final-383311.uc.r.appspot.com/comments';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode(comment);
  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Handle successful response
    print(response.body);
  } else {
    // Handle error response
    print('Request failed with status: ${response.statusCode}.');
  }
}

//A future function to send emails
Future<void> sendEmails() async {
  final smtpServer = gmail('hilltophangout1@gmail.com', 'What3v3r');


  final querySnapshot =
      await FirebaseFirestore.instance.collection('users_data').get();
  final emailAddresses =
      querySnapshot.docs.map((doc) => doc.data()['email']).toList();

  for (final recipientEmail in emailAddresses) {
    final message = Message()
      ..from = Address('hilltophangout1@gmail.com', 'Hilltop Hangout')
      ..recipients.add(recipientEmail)
      ..subject = 'New Post Made!'
      ..text = 'Someone just made a new post! Head on to Hilltop Hangout to check it out.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent to $recipientEmail: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email to $recipientEmail: $e');
    }
  }
}
