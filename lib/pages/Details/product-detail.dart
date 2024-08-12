// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/cart_controller.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/pages/cart/cart_page.dart';
import 'package:sampleproject/pages/home/main_page.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/app_consts.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_column.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:sampleproject/widgets/expandable_text_widget.dart';

 

class ProductDetail  extends StatelessWidget {
  final int pageId;
  final String page;
   ProductDetail  ({ Key? key, required this.pageId,required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rating = 3.0;
    var product = Get.find<ProductController>().ProductList[pageId];
    Get.find<ProductController>().initProduct(product,Get.find<CartControler>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
         Positioned(
           left: 0,// from 0 left
           right: 0,// to 0 right
           child: Container(
           width: double.maxFinite,
           height: Dimensions.popularfoodimgsize,
           // ignore: prefer_const_constructors
           decoration: BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.cover,
               image: NetworkImage(
                AppConsts.BASE_URI+"/"+product.image!
             ))
           ),
         )
         ) ,
         //icon widgets
         Positioned(
           top: Dimensions.height45,
           left: Dimensions.width20 , 
           right:Dimensions.width20 ,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               GestureDetector(
                onTap: ()
                {
                  if(page=="cartpage")
                  {
                    Get.toNamed(RouteHelper.getCart());
                  }
               
                  else
                  {
                    Get.toNamed(RouteHelper.getInitial());
                  }
                 
                },
                child: APPIcon(icon: Icons.arrow_back_ios)
                ),

               GetBuilder<ProductController>(builder: (controller)
               {
                return GestureDetector(  
                 onTap: ()
                  {
                    if(controller.totalItems>=1)
                    {
                      Get.toNamed(RouteHelper.getCart());
                    }
                     
                  },
                  child: Stack
                  (
                    children: [
                     APPIcon(icon: Icons.shopping_cart_outlined,),
                         controller.totalItems>=1?
                        Positioned(
                          right: 0,
                          top: 0,
                          
                            child: APPIcon(icon: Icons.circle,size: 20,iconcolor: Colors.transparent,backgroundcolor:AppColors.mainColor)
                            
                            ):
                         Container(),
                           Get.find<ProductController>().totalItems>=1?
                        Positioned(
                          right: 3,
                          top: 3,
                          child: BigText(text:Get.find<ProductController>().totalItems.toString() ,size: 12,color: Colors.white,)):
                         Container(),
                     
                    ],
                  ),
                );

               })
             ],

         )
         ),
        //
         Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           top:  Dimensions.popularfoodimgsize-20,
           child: Container(
          padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top:Dimensions.height20 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              topLeft: Radius.circular(Dimensions.radius20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppColumn(text: product.name!),
              SizedBox(height: Dimensions.height20,),
              BigText(text: "Introduce"),

              Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text:product.detail))),
        //       SmoothStarRating(
        //   rating: rating,
        //   isReadOnly: false,
        //   size: 80,
        //   filledIconData: Icons.star,
        //   halfFilledIconData: Icons.star_half,
        //   defaultIconData: Icons.star_border,
        //   starCount: 5,
        //   allowHalfRating: true,
        //   spacing: 2.0,
        //   onRated: (value) {
        //     print("rating value -> $value");
        //     // print("rating value dd -> ${value.truncate()}");
        //   },
        // )

            ],
          ),
         ),
         ),
      

        ],
        
      ),
      
      bottomNavigationBar: GetBuilder<ProductController>(builder: (productc)
      {
      return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20) ,
        decoration: BoxDecoration(
          color:AppColors.buttonBackgroundColor ,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                      GestureDetector(
                    onTap: () {
                      productc.setQuantity(false);
                    },
                    child: Icon(Icons.remove,color: AppColors.signColor)),
                  SizedBox(width:Dimensions.width10/2 ,),
                  BigText(text: productc.inCartItems.toString()),
                  SizedBox(width:Dimensions.width10/2 ,),
                  GestureDetector(
                    onTap: () {
                      productc.setQuantity(true);
                    },
                    child: Icon(Icons.add,color: AppColors.signColor))
                ],
              ),
            ),
         Container(
            padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
           child :GestureDetector(
            onTap:()
            {
               productc.addItem(product);
            } ,
            child: BigText(
              text: "\$ ${product.price!} |Add to cart",color: Colors.white
              )
              ) ,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(Dimensions.radius20),
             color: AppColors.mainColor,
           ),
         )
          ],
        ),
      );
      },
      ),
    );
  }
}