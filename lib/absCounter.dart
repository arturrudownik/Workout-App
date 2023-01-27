
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class absCounter extends StatefulWidget {
  const absCounter({super.key});

  @override
  _absCounter createState() => _absCounter();
}

class _absCounter extends State<absCounter> {

  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  late String message = 'Do as many situps as you can!';

  Widget buildTime() {
    final isCompleted = seconds == 0;

    return isCompleted
      ? ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
        ),
      ),
      child: Text('Continue?', style: GoogleFonts.roboto(fontSize: 35, color: Colors.black),),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => absCounter()
        ));
        },
    ) : Text(
      '$seconds',
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
    ),
    body: Container(
      height: 500,
      width: 600,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            Text(message, style: GoogleFonts.roboto(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    )
  );

  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      }
      else {
        stopTimer();
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      breakTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  void breakTimer() => setState(() {
    message = 'Great job! Do you want to continue?';
  });
}