import 'package:flutter/material.dart';
import 'package:workout_app/local_notifications.dart';
import 'package:workout_app/services/authService.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'NavigationDrawerWidget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class _HomePageState extends State<HomePage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var goal = 5000;
  String _status = '?', _steps = '?';
  @override
  void initState() {
    super.initState();
    initPlatformState();
    LocalNotification.initialize(flutterLocalNotificationsPlugin);
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void dailyGoal() {
    if (int.parse(_steps) == 5000) {
      LocalNotification.showNotification(
          title: "Congratulations!",
          body: "You reached your daily step goal!",
          fln: flutterLocalNotificationsPlugin);
    }
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Step Counter'),
          centerTitle: true,
          titleTextStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Steps taken:',
                  style: GoogleFonts.roboto(fontSize: 30, color: Colors.black)),
              Text(_steps,
                  style: GoogleFonts.roboto(fontSize: 30, color: Colors.black)),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.black,
              ),
              Text('Daily goal:',
                  style: GoogleFonts.roboto(fontSize: 30, color: Colors.black)),
              Center(
                child: Text(
                  goal.toString(),
                  style: GoogleFonts.roboto(fontSize: 30),
                ),
              ),
              const Text(''),
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                elevation: 0.1,
                onPressed: () {
                  setState(() {
                    //todo zaimplementować reset kroków
                    _steps = 0 as String;
                  });
                },
                child: const Icon(
                  Icons.replay_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
