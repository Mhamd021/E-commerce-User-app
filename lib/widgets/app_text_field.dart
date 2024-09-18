// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utili/colors.dart';
import '../utili/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool isObs ; 
   AppTextField({ Key? key ,
  required this.textController,
  required this.hintText,
  required this.icon,
  this.isObs = false,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Container(
            margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20),
            decoration: BoxDecoration
            (
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius30) ,
              boxShadow: 
              [
                BoxShadow
                (
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: Offset(1, 10),
                  color: Colors.grey.withOpacity(0.2),
                )
              ]
            ) ,

            child: TextFormField
            (
              obscureText: isObs?true:false,
              controller: textController,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon,color: AppColors.mainColor,),
                focusedBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide
                  (
                    width: 1.0,
                    color: Colors.white,
                  )
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide
                  (
                    width: 1.0,
                    color: Colors.white,
                  )
                ),
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),

              ),
            ),
          );
  }
}  