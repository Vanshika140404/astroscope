import 'package:flutter/material.dart';

void main() => runApp(Space());

class Space extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroScope',
      theme: ThemeData(
        primaryColor: Colors.black
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}