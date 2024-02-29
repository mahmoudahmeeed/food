import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final fontWeight;
  
  const RoundButton({
    super.key,
     required this.title, 
     required this.onPressed, 
      this.fontSize=20,
      this.fontWeight=FontWeight.w700, 
      });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    textColor: Colors.white,
    color: Colors.white,
    height: 50,
    minWidth: double.maxFinite,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)) , 
   child: Text(title,
   style: TextStyle(
    color: Colors.orange,
    fontSize: fontSize,
    fontWeight: fontWeight,
   ),), );
  }
}