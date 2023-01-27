import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/services/authService.dart';
import 'package:workout_app/signup_page.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  late String email, password;
  //Color green = const Color(0xFF00AF19);

  //sprawdzanie pól logowania
  checkFields() {
    final form = formKey.currentState;
    if(form!.validate()) {
      form.save();
      return true;
    }
      return false;
  }

  //walidacja email
  String? validateEmail(String value) {
    RegExp regexp =  RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regexp.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }
  _buildLoginForm() {
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 70.0),
          Container(
            height: 135.0,
            width: 200.0,
            child: Stack(
              children:  [
                Text('Welcome',
                style: GoogleFonts.roboto(fontSize: 70, color: Colors.black)
                ),
                Positioned(
                  top: 60.0,
                  child: Text(
                    'Back',
                      style: GoogleFonts.roboto(fontSize: 70, color: Colors.black)
                  ),
                ),
                Positioned(
                  top: 115.0,
                  left: 160.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          TextFormField(
          decoration: InputDecoration(
              labelText: 'EMAIl',
              labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                  color: Colors.black.withOpacity(0.8)
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              )
          ),
          onChanged: (value) {
            this.email = value;
          },
          validator: (value) => value!.isEmpty ? 'Email is required':validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12.0,
                      color: Colors.black.withOpacity(0.8)
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )
              ),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) => value!.isEmpty ? 'Password is required': null),
          const SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              //todo reset hasła
          },
          child: Container(
            alignment: const Alignment(1.0, 0.0),
            padding: EdgeInsets.only(top: 15.0, left: 20.0),
            child:  InkWell(
              child: Text(
                'Forgot password?',
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 12.0, decoration: TextDecoration.underline),
              ),
            ),
          ),
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () async {
              PermissionStatus pedometerStatus = await Permission.activityRecognition.request();
              if (pedometerStatus == PermissionStatus.granted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permission granted')));
              }
              if (checkFields()) {
                AuthService().signIn(email, password, context);
              }
            },
            child: Container(
              height: 50,
            child: Material(
              borderRadius: BorderRadius.circular(25.0),
              shadowColor: Colors.deepPurpleAccent,
              color: Colors.deepPurpleAccent,
              elevation: 7.0,
              child: Center(
                child: Text('LOGIN',
                style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
          )
          ),
          SizedBox( height: 30.0),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpPage()
                ));
              },
              child: SizedBox(
                height: 50,
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  shadowColor: Colors.deepPurple,
                  color: Colors.deepPurpleAccent,
                  elevation: 7.0,
                  child: Center(
                    child: Text('SIGN UP',
                        style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}