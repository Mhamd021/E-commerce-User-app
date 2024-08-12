
    
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_new, must_call_super, prefer_final_fields

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/controllers/shop_controller.dart';
import 'package:sampleproject/models/product_model.dart';
import 'package:sampleproject/models/shop_model.dart';
import 'package:sampleproject/pages/Details/product-detail.dart';
import 'package:sampleproject/pages/Details/shop_detail.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/app_consts.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_column.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:sampleproject/widgets/icon_and_text_widget.dart';
import 'package:sampleproject/widgets/small_text.dart';

import '../../controllers/category_controller.dart';
import '../../models/category_model.dart';




class HomePageBody  extends StatefulWidget {
  final int pageId;
  const HomePageBody ({ Key? key ,required this.pageId}) : super(key: key);

  @override
  State<HomePageBody> createState() => _State();
}

class _State extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;

  // ignore: non_constant_identifier_names
  double ScaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer ;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
setState(() {
  _currentPageValue = pageController.page!;
});
     });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       //slider section
  
   //dots
 
    
 
   //popular text
   SizedBox(height: Dimensions.height30,),
    Container(
      margin: EdgeInsets.only(left: Dimensions.width30,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Products"),
          SizedBox(width: Dimensions.width10,),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
             child:BigText(text: ".",color: Colors.black26,) ,
          ),
           SizedBox(width: Dimensions.width10,),
           Container(
             margin: const EdgeInsets.only(bottom: 2),
             child: SmallText(text: "",),
           ),


        ],
      ),
    )
   //List of products and images
    ,
    
     

    
     ], 
    ); }

}