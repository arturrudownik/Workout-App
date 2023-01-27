import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_android/android_hardware.dart';
//import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:all_sensors/all_sensors.dart';
import 'package:get_storage/get_storage.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final box = GetStorage();

  void store() {
    box.write(day.toString(), m);
  }

  var day = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
  double _proximityValues = 0;
  int m = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text('Pushup Counter'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (box.read(day.toString()) != null) {
                m = box.read(day.toString()) + m;
                box.remove(day.toString());
              }
              store();
              m = 0;
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('You did '),
                    Text(
                      m.toString(),
                      style:
                          const TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.teal,
              child: const Icon(Icons.replay_outlined, color: Colors.black,),
              onPressed: () {
                setState(() {
                  m = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    sensors;
  }

  void sensors() async {
    var sensor = await SensorManager.getDefaultSensor(Sensor.TYPE_PROXIMITY);
    var events = await sensor.subscribe();
    events.listen((SensorEvent event) {
      setState(() {
        _proximityValues = event.values[0];
        if (_proximityValues == 0) {
          m++;
        }
        else {
          m;
        }
      });
    });
  }
}


