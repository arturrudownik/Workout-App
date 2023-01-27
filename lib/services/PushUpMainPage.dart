import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chartPage.dart';
import '../pushUpCounter.dart';

class PushUpPage extends StatelessWidget {
  const PushUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Pushup Counter'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Page1(),
          drawer: Builder(builder: (context) {
             return Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Analysis'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return chartPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ));
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Container(child: Image.asset('image/pushUp.png', scale: 1.3)),
          Text('Place your phone under your chest and press Start', textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),

          Container(
            height: 100,
            width: 400,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page2()
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
                    child: Text('Start',
                        style: GoogleFonts.roboto(color: Colors.black, fontSize: 30,)),
                  ),
                ),
              ),
            ),
          )
        ],
    )
    );
}
}
