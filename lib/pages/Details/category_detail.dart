// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/category_controller.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:sampleproject/widgets/expandable_text_widget.dart';

import '../../controllers/product_controller.dart';
import '../../utili/app_consts.dart';
import '../../widgets/app_column.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class CategoryDetail   extends StatelessWidget {
 final int pageId;
   CategoryDetail  ({ Key? key ,required this.pageId}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var category = Get.find<CategoryController>().categoryList[pageId];
    
    
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height10,),
            SizedBox(height: Dimensions.height10,),
            SizedBox(height: Dimensions.height10,),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top:Dimensions.width10 ),
                height: Dimensions.pageView,
                child: Stack(
            children: [
                   Container(            
                          height: Dimensions.pageViewContainer,
                          margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top:Dimensions.width10 ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),
                
                    image : DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConsts.BASE_URI+"/"+category.image!),
                    )
                         ),
                          ), 
                     Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                  height:Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(left:Dimensions.width30 ,right: Dimensions.width30,bottom: Dimensions.height30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Colors.white,
            boxShadow: [
                BoxShadow(
                 color: Color(0xffe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0, 5)
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0)
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0)
                )
            ]
                 ),
                 child: Container(
                   padding: EdgeInsets.only(top: Dimensions.height15,left: 15,right: 15),
                   child: AppColumn(text: category.name!),
                 ), 
                 
                  ),
          ),
           
           
                
            
                
        
            ],
          ),
              ),
              // Container(
              //                      padding: EdgeInsets.only(top: Dimensions.height15,left: 0,right: 15),
              //   child: BigText(text: "This is "+category.name!+" Products!"),
              // ),
        GetBuilder<ProductController>(builder:(products)
          {
            
            return products.isLoaded?ListView.builder(
          
            physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.ProductList.length,
          itemBuilder: (context,index){
               if(products.ProductList[index].category== category.name!)
            {
  return GestureDetector(
            onTap: ()
            {
              Get.toNamed(RouteHelper.getProduct(index,"category"));
            },
         
            child: Container(
             margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
             child: Row(
              children: [
                //image section
                Container(
                    width: Dimensions.listviewImgSize,
                    height: Dimensions.listviewImgSize, 
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(Dimensions.radius20),
                     color: Colors.white38,
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: NetworkImage(
                         AppConsts.BASE_URI+"/"+products.ProductList[index].image!
                         ),
                         ),
                   ), 
                    
                  ),
               
                //text container
                Expanded(
                  child: Container(
                    height: Dimensions.listviewtextconsize,
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20 ),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         BigText(text: products.ProductList[index].name),
                         SizedBox(height: Dimensions.height10,),
                         SmallText(text: products.ProductList[index].detail),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(icon: Icons.monetization_on,
                               text: products.ProductList[index].price.toString(),
                            
                                iconColor: AppColors.mainColor),
                                 
                            ], 
                           ),
                         
                          
                        ],
                      ),
                      ),
                       ),
                      
                  ),
                  
                
              ], 
             ),
            ),
          );
        }
        else
        {
          return Container
          (
            // child: Column
            // (
            //   children: 
            //   [
            //     BigText(text: "Sorry!"),
            //     SmallText(text: "There is no products in this category")
            //   ],
            // )  
          );
        }
            }
        ):CircularProgressIndicator
        (
          color: AppColors.mainColor,
        );
          }),
          ]
        ),
      ),
    );
 
  }
}//5
    