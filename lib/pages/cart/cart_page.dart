// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/auth_controller.dart';
import 'package:sampleproject/controllers/cart_controller.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/pages/based/no_data_page.dart';
import 'package:sampleproject/utili/app_consts.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';
import '../../routes/route_helper.dart';
import '../../widgets/icon_and_text_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Stack
      (
        children: 
        [
          Positioned(
            top: Dimensions.height30*2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                GestureDetector(
                   onTap:()
                  {
                   Get.toNamed(RouteHelper.getInitial());
                  },
                  child: APPIcon(
                    icon: Icons.arrow_back_ios,iconcolor: Colors.white,backgroundcolor: AppColors.mainColor,iconsize:Dimensions.iconSize24 ,)),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap:()
                  {
                   Get.toNamed(RouteHelper.getInitial());
                  },
                  child: APPIcon(icon: Icons.home_outlined,iconcolor: Colors.white,backgroundcolor: AppColors.mainColor,iconsize:Dimensions.iconSize24 ,)),
                APPIcon(icon: Icons.shopping_cart,iconcolor: Colors.white,backgroundcolor: AppColors.mainColor,iconsize:Dimensions.iconSize24 ,)
              ],

            ),
            ),
      GetBuilder<CartControler>(builder: (_cartController)
      {
        return _cartController.getItems.isNotEmpty? Positioned(
        top: Dimensions.height20*5,
        left: Dimensions.width20,
        right:Dimensions.width20 ,
        bottom: 0,
        child: Container(
          margin: EdgeInsets.only(top: Dimensions.height15),
          child: MediaQuery.removePadding(
            context:context ,
            removeTop: true,
            child: GetBuilder<CartControler>(builder: (cartControler)
            {
              var _cartList = cartControler.getItems;
              return ListView.builder(
              itemCount:_cartList.length,
              itemBuilder: (_,index)
            {
              return GestureDetector(
                onTap: ()
        {
           var productindex =  Get.find<ProductController>().productList.indexOf(_cartList[index].product!);
          Get.toNamed(RouteHelper.getProduct(productindex,"cartpage"));
        },
                child: SizedBox
                (
                    height: Dimensions.height20*5,
                    width: double.maxFinite,
                    child: Row
                    (
                      children: 
                      [
                        Container
                        (
                          width: Dimensions.height20*5,
                          height: Dimensions.height20*5, 
                          margin: EdgeInsets.only(bottom: Dimensions.height10),
                          decoration: BoxDecoration
                          (
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:NetworkImage
                              (
                                AppConsts.BASE_URI+"/"+cartControler.getItems[index].image!,
                              ),
                              
                               ),
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white, 
                          ),
              
                        ),
                        SizedBox(width: Dimensions.width10),
                        Expanded(
                          child:SizedBox(
                            height: Dimensions.height10*10,
                            child: Column
                            (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: 
                              [
                                BigText(text: cartControler.getItems[index].name!,color: Colors.black45,),
                               
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: 
                                  [
                                    
                                      IconAndTextWidget(icon: Icons.monetization_on,
                             text: cartControler.getItems[index].price.toString(),
                          
                              iconColor: AppColors.mainColor),
                                    
                                       Container(
                padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                        GestureDetector(
                      onTap: () {
                      cartControler.addItem(_cartList[index].product!, -1);
                      },
                      child: Icon(Icons.remove,color: AppColors.signColor)),
                    SizedBox(width:Dimensions.width10/2 ,),
                    BigText(text:_cartList[index].quantity.toString() ),
                    SizedBox(width:Dimensions.width10/2 ,),
                    GestureDetector(
                      onTap: () {
                        cartControler.addItem(_cartList[index].product!, 1);
                      },
                      child: Icon(Icons.add,color: AppColors.signColor))
                  ],
                ),
                          ),
                                  ],
                                )
                              ],
                            ),
                          ) 
                          )
                      ],
                    )
                ),
              );
            });
            }
          ),
       ),
       )
      ):NoDataPage(text: "Your cart is empty!");
      }),
      ],
      ),
    bottomNavigationBar: GetBuilder<CartControler>(builder: (cartproduct)
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
        child: cartproduct.getItems.isNotEmpty?Row(
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
                      
                  SizedBox(width:Dimensions.width10/2 ,),
                  BigText(text:"\$"+ cartproduct.totalAmount.toString()),
                  SizedBox(width:Dimensions.width10/2 ,),
                 
                ],
              ),
            ),
         Container(
            padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
           child :GestureDetector(
            onTap:()
            {
              if(Get.find<AuthController>().userLoggedIn())
              {
                Get.toNamed(RouteHelper.getCheckOut());
              }
              else
              {
                Get.toNamed(RouteHelper.getSignIn());
              }
             
              // productc.addItem(product);
            } ,
            child: BigText(
              text: "Check out",color: Colors.white
              )
              ) ,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(Dimensions.radius20),
             color: AppColors.mainColor,
           ),
         )
          ],
        ):Container(),
      );
      },
      ),
    );
  }
}//