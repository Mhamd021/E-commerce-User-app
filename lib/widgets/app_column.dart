// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../utili/colors.dart';
import '../utili/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';


class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({ Key? key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     BigText(text: text, size: Dimensions.font26,),
                     SizedBox(height: Dimensions.height10,),
                     
                     SizedBox(height: Dimensions.height20,),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       // IconAndTextWidget(icon: Icons.circle_sharp,
                         //text: "order now",
                      
                          //iconColor: AppColors.mainColor),
                           IconAndTextWidget(icon: Icons.location_on,
                         text: "where ever you are",
                      
                          iconColor: AppColors.mainColor),
                           IconAndTextWidget(icon: Icons.access_time_filled_rounded,
                         text: "in no time",
                      
                          iconColor: AppColors.iconColor2)
                      ], 
                     )
                   ],
                 );
  }
}