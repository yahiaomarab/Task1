import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Widget Button(
    {
      required String label,
      required GestureTapCallback? onTap,
      required Color color,
      required Color textColor,
    }
    )
{
  return GestureDetector(
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 46,
          width: 101,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(label,textAlign: TextAlign.center,style: TextStyle(
            fontFamily: 'LightFont',
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.bold,
          )),
        ),
      ],
    ),
    onTap: onTap,

  );
}
navigateTo(context,widget)
{
  Navigator.push(
    context,
    PageTransition(child: widget, type: PageTransitionType.fade,duration: Duration(milliseconds: 500),),
  );
}
 Widget circleColor(
{
  required Color color,
  required GestureTapCallback ontap,
}
     )
{
  return GestureDetector(
    onTap:ontap ,
    child: Stack(
      children: [
        CircleAvatar(
          radius:11 ,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 10,
          backgroundColor: color,
        ),

      ],
    ),
  );
}
Widget longButton(
    context,
    {
      required String label,
      required GestureTapCallback? onTap,
      required Color buttonColor,
      required Color textColor
    }
    )
{
  final isLandScpe=MediaQuery.of(context).orientation==Orientation.landscape;
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      height:isLandScpe?MediaQuery.of(context).size.height*0.1: MediaQuery.of(context).size.height*0.07,
      width:isLandScpe?MediaQuery.of(context).size.width*0.4: MediaQuery.of(context).size.width*0.58,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(label,textAlign: TextAlign.center,style: TextStyle(
        fontSize: 20,
        color: textColor,

      ),),
    ),
    onTap: onTap,

  );
}