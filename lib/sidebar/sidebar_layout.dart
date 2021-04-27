import 'package:flutter/material.dart';
import 'package:team_technocrunch/pages/HomePage.dart';
import 'package:team_technocrunch/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
       children: <Widget> [
         HomePage(),
         SideBar(),
       ],
      ),
    );
  }
}
