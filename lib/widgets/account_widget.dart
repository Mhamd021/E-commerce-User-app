import 'package:flutter/material.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  final APPIcon appIcon;
final BigText bigText;
 AccountWidget({ Key? key ,required this.appIcon,required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container
    (
      padding: EdgeInsets.only
      (
        left: Dimensions.width20,
        top: Dimensions.width10,
        bottom: Dimensions.width10,
      ),
      child: Row
      (
        children: 
        [
          appIcon,
          SizedBox(width: Dimensions.width20 ,),
          bigText,
        ],
      ),
      decoration: BoxDecoration
      (
        color: Colors.white,
        boxShadow: 
        [
         BoxShadow
         (
          blurRadius: 1,
          offset: const Offset(0, 5),
          color: Colors.grey.withOpacity(0.2),
         ),
          
        ]
      ),
    );
  }
}