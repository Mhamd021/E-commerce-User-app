// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/controllers/shop_controller.dart';
import 'package:sampleproject/models/product_model.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:sampleproject/widgets/expandable_text_widget.dart';

import '../../controllers/cart_controller.dart';
import '../../utili/app_consts.dart';

class ShopDetail   extends StatelessWidget {
 final int pageId;
   ShopDetail  ({ Key? key ,required this.pageId}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(()=>ProductModel());
    var shop = Get.find<ShopController>().shopList[pageId];
      var productm = Get.find<ProductModel>();
     List<dynamic> shopProducts=[];
    
   
    
    var product = Get.find<ProductController>();
    for (var v in product.productList) {
      if(product.productList[v].storeId == shop.id)
      {
        shopProducts.add(product.productList[v]);
        print(shopProducts);
      }
      else
      {
        print("object");
      }
    }
    Get.find<ProductController>().initProduct(productm,Get.find<CartControler>());
    return Scaffold(
      backgroundColor: Colors.white ,
      body: CustomScrollView
      (
        slivers:
         [
           SliverAppBar
           (  
            automaticallyImplyLeading: false,
             toolbarHeight: Dimensions.toolbarheight,
             title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                  onTap: ()
                  {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: APPIcon(icon: Icons.clear)),
                 //APPIcon(icon: Icons.arrow_back_ios),
                SizedBox(),
                 APPIcon(icon: Icons.shopping_cart_outlined),

               ],
             ) ,
             bottom: PreferredSize(
               preferredSize: Size.fromHeight(Dimensions.height20) ,
               child: Container(
                 
                
                
                child: Center(child: BigText(size: Dimensions.font26 ,text: shop.name!)),
                width: double.maxFinite,
                 padding: EdgeInsets.only(top:Dimensions.height10/2,bottom: Dimensions.height10),
                 decoration: BoxDecoration(
                   color: Colors.white, 
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                   )
                 ),
               ),
             ),
             pinned: true,
             backgroundColor: AppColors.mainBlackColor,
             expandedHeight: Dimensions.sliv,
             flexibleSpace: FlexibleSpaceBar
            (
              background: Image.network
            (
                AppConsts.BASE_URI+"/"+shop.image!,
                width: double.maxFinite,
                fit: BoxFit.cover,
                
              
            ),  
            ),
            ),
           SliverToBoxAdapter
            (
              child: Column
              (
                children: [
                  Container
                  (
                   
                    child: ExpandableTextWidget(text:"Welcome to"+shop.name!+"Shop" ),
                    margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20 ),
                  ),
                ],
              ),
            )
         ],
      ),
   bottomNavigationBar:
    Column
    (
      mainAxisSize: MainAxisSize.min,
     children: [
       Container(
         padding : EdgeInsets.only(
           left: Dimensions.width20*2.5,
           right: Dimensions.width20*2.5,
           top: Dimensions.height10,
           bottom: Dimensions.height10,
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:
            [
              APPIcon(
                iconsize: Dimensions.iconSize24,
                iconcolor: Colors.white,
              backgroundcolor: AppColors.mainColor, 
              icon: Icons.remove),

              BigText(text: "\$12.88"+"X"+"0"),

               APPIcon(
                iconsize: Dimensions.iconSize24,
                iconcolor: Colors.white,
              backgroundcolor: AppColors.mainColor, 
              icon: Icons.add),
           ],
         ),
       ),
     ],
   ),
    );
  }
}//5