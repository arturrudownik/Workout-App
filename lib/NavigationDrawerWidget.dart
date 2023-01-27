import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/services/PushUpMainPage.dart';
import 'package:workout_app/services/authService.dart';

import 'abWorkoutPage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10, vertical: 20);

  Color myPurple = const Color.fromRGBO(124, 58, 240, 1);

  NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Material(
        color: myPurple,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Pushup Counter',
              icon: Icons.accessibility_sharp,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Abs workout',
              icon: Icons.airline_seat_flat,
                onClicked: () => selectedItem(context, 1)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Placeholder',
              icon: Icons.architecture,
                onClicked: () {}
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Placeholder',
              icon: Icons.sick,
                onClicked: () {}
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.black, thickness: 2.5),
            const SizedBox(height: 24),

            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Options',
              icon: Icons.settings,
              onClicked: () {}
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () {}
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.login,
              onClicked: () => selectedItem(context, 4),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
}) {
    const color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: GoogleFonts.roboto(color: Colors.white)),
      onTap: onClicked,
    );
  }
  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PushUpPage(),
            ));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AbWorkoutPage(),
            ));
        break;
      case 4:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AuthService().signOut(),
            ));
        break;
    }
  }
}