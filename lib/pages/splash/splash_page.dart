
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/dimensions.dart';

import '../../controllers/category_controller.dart';
import '../../controllers/product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{
  late Animation<double> animation;
 Future<void>_LoadResource()
async {
  await Get.find<CategoryController>().getcategorylist();
  await Get.find<ProductController>().getProductList();
   
}
  late AnimationController controller;
@override
void initState()
{
  super.initState();
  _LoadResource();
  controller =  AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
  animation =  CurvedAnimation(parent: controller, curve: Curves.linear);
  Timer
  (
   const Duration(seconds: 3),
    
     ()=>Get.offNamed(RouteHelper.getInitial()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor:  Colors.white,
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/image/pngtest.png",width: Dimensions.splashImf,)))
        ],
      ),
    );
  }
}