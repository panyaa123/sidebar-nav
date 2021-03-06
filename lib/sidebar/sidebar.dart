import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
AnimationController _animationController;
StreamController<bool> isSidebarOpenedStreamController;
Stream<bool> isSidebarOpenedStream;
StreamSink<bool> isSidebarOpenedSink;
final  _animationDuration = const Duration(milliseconds: 500);


@override
void initState(){
  super.initState();
  _animationController = AnimationController(vsync: this,duration:  _animationDuration);
  isSidebarOpenedStreamController = PublishSubject<bool>();
  isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
  isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
}

@override
void dispose(){
  _animationController.dispose();
  isSidebarOpenedStreamController.close();
  isSidebarOpenedSink.close();
  super.dispose();
}

void onIconPressed(){
  final animationStatus =_animationController.status;
  final isAnimationCompleted = animationStatus == AnimationStatus.completed;

  if(isAnimationCompleted){
    isSidebarOpenedSink.add(false);
    _animationController.reverse();
  }
  else{
    isSidebarOpenedSink.add(true);
_animationController.forward();
  }


}



@override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync){
       return AnimatedPositioned(
         duration: _animationDuration,
         top: 0,
         bottom: 0,
         left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
         right: isSideBarOpenedAsync.data? 0 : screenWidth - 45,
         child: Row(
           children: <Widget>[
             Expanded(
               child: Container(
                 color: const Color(0xFF262AAA),
                 child: Column(
                   children: [
                     SizedBox(height: 100,),
                     ListTile(
                       title: Text("Welcome to \n"
                           " Team Technocrunch",style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                         fontSize: 30,
                       ),
                       ),
                     ),
                     Divider(
                       height: 64,
                       thickness: 0.5,
                       color: Colors.white.withOpacity(0.3),
                       indent: 16,
                       endIndent: 16,

                     ),

                   ],
                 ),
               ),
             ),
             Align(
               alignment: Alignment(0,-0.9),
               child: GestureDetector(
                 onTap: (){
                   onIconPressed();
                 },
                 child: Container(
                   width: 35,
                   height: 110,
                   color: Color(0xFF262AAA),
                   alignment: Alignment.centerLeft,
                   child: AnimatedIcon(
                     progress: _animationController.view,
                     icon: AnimatedIcons.menu_close,
                     color: Color(0xFF1BB5FD),
                     size: 25,
                   ),
                 ),
               ),
             )
             ,
           ],
         ),
       );
      },

    );
  }
}
