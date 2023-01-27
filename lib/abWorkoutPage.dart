

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'absCounter.dart';

class AbWorkoutPage extends StatefulWidget {
   AbWorkoutPage({super.key});

  @override
  _AbWorkoutPageState createState() => _AbWorkoutPageState();

}

class _AbWorkoutPageState extends State <AbWorkoutPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Situps', style: GoogleFonts.roboto(color: Colors.white, fontSize: 25)),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    ),
    body: Column (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 400,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/sitUp.jpg'),
              fit: BoxFit.fill
            )
          ),
        ),
         Text('Do sit-ups for the indicated time', style: GoogleFonts.roboto(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        Text('Press start for the countdown to begin', style: GoogleFonts.roboto(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)
            ),
          ),
          child: Text('Start', style: GoogleFonts.roboto(fontSize: 50, color: Colors.black)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => absCounter()
            ));
          },
        )
      ],
      )
  );
}

