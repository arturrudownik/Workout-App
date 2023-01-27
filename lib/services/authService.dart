

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:workout_app/error_handler.dart';
import 'package:workout_app/login_page.dart';

import '../home_page.dart';

class AuthService {

  //sprawdzanie autentykacji użytkownika
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        }
        else {
          return const LoginPage();
        }
      }
    );
  }

  //wylogowanie
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //logowanie
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print('signed in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  //rejestracja nowego użytkownika
  signUp(String email, String password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
}