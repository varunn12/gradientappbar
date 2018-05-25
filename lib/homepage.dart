import 'package:flutter/material.dart';


// LinearGradient parameters are quite easy to understand:

// colors: an array of the colors to be used in the gradient, in this case, two shades of blue.
// begin, end: position of the first color and the last color, in this case, FractionalOffset allows us to treat the coordinates as a range from 0 to 1 both for x and y. As we want an horizontal gradient, we use same Y for both measures, and the x changes from 0.0 (left) to 1.0 (right).
// stops: this array should have the same size than colors. It defines how the colors will distribute. [0.0, 1.0] will fill it from left to right. [0.0, 0.5] will fill the colors from left to half bar, etc.
// tileMode: what to do if the stops do not fill the whole area. In this case, we added clamp (it will reuse the last color used), but as our gradient goes from 0.0 to 1.0, it’s not really necessary.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("gradient"),
                  ],
                ),
              );
            }
          }
          
     class GradientAppBar extends StatelessWidget {
      final String title;
      final double barHeight=66.0;
      

      GradientAppBar(this.title);
      
       @override
       Widget build(BuildContext context) {
         //adding this so that the screen should not begin behind the status bar of the phone
         final double statusBarHeight = MediaQuery
      .of(context)
      .padding
      .top;
         return new Container(
           padding: new EdgeInsets.only(
             top: statusBarHeight
           ),
           height: barHeight+statusBarHeight,
           decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [      const Color(0xFF3366FF),
              const Color(0xFF00CCFF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
            )
           ),
           child: new Center(
                        child: new Text(title,
             style: const TextStyle(color: Colors.white,
             fontFamily: 'Poppins',
             fontWeight: FontWeight.w600,
             fontSize: 36.0),),
           ),
         );
       }
     }