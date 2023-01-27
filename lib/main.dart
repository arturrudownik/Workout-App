import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/login_page.dart';
import 'package:workout_app/services/authService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
    );
  }
}