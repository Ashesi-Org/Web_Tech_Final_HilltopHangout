import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HilltopHangout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'TextMeOne'
      ),
      home: const MyHomePage(title: 'Hilltop Hangout',),
    );

  
  }
}
