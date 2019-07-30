import 'package:flutter/material.dart';
import 'Main_Screen.dart';
void main() => runApp(store());

class store extends StatefulWidget {
  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id:(context) => MainScreen(),
      },

    );
  }
}
