import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Text("Home Page",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),),
        ),
      ),
    );
  }
}
