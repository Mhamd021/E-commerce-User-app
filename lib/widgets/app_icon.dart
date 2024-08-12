// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class APPIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor ; 
  final Color iconcolor ; 
  final double size;
  final double iconsize;
   APPIcon({ Key? key,
  required this.icon,
  this.backgroundcolor= const Color(0xFFfcf4e4),//it has to be constant color in widget value
  this.iconcolor= const Color(0xFF756d54),
  this.size = 40,
  this.iconsize = 16
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolor
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconsize
      ),
    );
  }
}