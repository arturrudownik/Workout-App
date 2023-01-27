import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class chartPage extends StatefulWidget {

  @override
  _chartPageState createState() => _chartPageState();
}

class _chartPageState extends State<chartPage> {
  final box = GetStorage();
  var day = DateFormat('EEEE, d, MMM, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(box.read(day.toString()).toString()?? 'null'),
      ),
    );
  }
}