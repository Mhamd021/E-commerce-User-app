// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/cart_controller.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/controllers/category_controller.dart';
import 'package:sampleproject/helper/dependencies.dart' as deb;
import 'package:sampleproject/routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deb.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (_) {
      return GetBuilder<ProductController>(builder: (_) {
        return GetBuilder<CartControler>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quick Delivery',
            defaultTransition: Transition.fade,
            transitionDuration: Duration(milliseconds: 100),
           // home: SignInPage(),
            initialRoute: RouteHelper.getSplash(),
            getPages: RouteHelper.routes,
          );
        });
      });
    });
  }
}
