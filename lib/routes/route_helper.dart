// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sampleproject/pages/Details/category_detail.dart';
import 'package:sampleproject/pages/Details/product-detail.dart';
import 'package:sampleproject/pages/Details/shop_detail.dart';
import 'package:sampleproject/pages/auth/sign_in_page.dart';
import 'package:sampleproject/pages/auth/sign_up_page.dart';
import 'package:sampleproject/pages/cart/cart_page.dart';
import 'package:sampleproject/pages/checkout/checkout_order.dart';
import 'package:sampleproject/pages/checkout/map.dart';
import 'package:sampleproject/pages/home/home_page.dart';
import 'package:sampleproject/pages/home/main_page.dart';

import '../pages/splash/splash_page.dart';
class RouteHelper 
{
  static const String initial = "/";
  static const String Splash = "/splash_page";
  static const String SignIn = "/sign_in";
  static const String SignUp = "/sign_up";
  static const String Product = "/product_detail";
  static const String Shop = "/shop_detail";
  static const String Category = "/category_detail";
  static const String Cart = "/cart_page";
  static const String Checkout = "/checkout_order";
   static const String map = "/map";


   static String getInitial()=>'$initial';
   static String getSplash()=>'$Splash';
   static String getProduct(int pageId,String page)=>'$Product?pageId=$pageId&page=$page';
  static String getShop(int pageId)=>'$Shop?pageId=$pageId';
  static String getCategory(int pageId)=>'$Category?pageId=$pageId';
  static String getCart()=>'$Cart';
  static String getSignIn()=>'$SignIn';
  static String getCheckOut()=>'$Checkout';
  static String getMap()=>'$map';
  static List<GetPage> routes = 
  [       
            GetPage(name:map, page: ()=>Map()),
          GetPage(name:initial, page: ()=>HomePage()),
          GetPage(name:Checkout, page: ()=>CheckoutOrder()),
          GetPage(name:Splash, page: ()=>SplashScreen()),
          GetPage(name:SignIn, page: ()=>SignInPage()),
          GetPage(name:SignUp, page: ()=>SignUpPage()),
          GetPage(name:Product, page: ()
          {

            var pageId =Get.parameters['pageId'];
            var page =Get.parameters['page'];
              return ProductDetail(pageId:int.parse(pageId!), page: page!);
          },
          transition: Transition.fadeIn,
          ),
             GetPage(name:Shop, page: ()
          {
              var pageId =Get.parameters['pageId'] ;
              return ShopDetail(pageId:int.parse(pageId!));
          },
          transition: Transition.fadeIn,
          ),
                GetPage(name:Category, page: ()
          {
              var pageId =Get.parameters['pageId'] ;
              return CategoryDetail(pageId:int.parse(pageId!));
          },
          transition: Transition.fadeIn,
          ),
          GetPage(name:Cart, page: () 
          {
            return CartPage();
          },
          transition: Transition.fadeIn,
          
          ),






  ];
}