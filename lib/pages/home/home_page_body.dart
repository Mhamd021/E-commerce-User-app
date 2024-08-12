
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
  const HomePageBody ({ Key? key }) : super(key: key);

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
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       //slider section
  GetBuilder<CategoryController>(builder: (categories)
  {

    return categories.isLoaded?Container(
      height: Dimensions.pageView,   
        child: PageView.builder(
          controller: pageController,
          itemCount: categories.categoryList.length,
          itemBuilder:((context, position){
          return _buildPageItem(position,categories.categoryList[position]);
        }),
         ),
      
    ):CircularProgressIndicator
    (
      color: AppColors.mainColor,
    );
  }),
   //dots
     GetBuilder<CategoryController>(builder: (categories)
     {
        return   new DotsIndicator(
     dotsCount: categories.categoryList.isEmpty?1:categories.categoryList.length,
     position: _currentPageValue ,
     decorator: DotsDecorator(
       size: const Size.square(9.0),
       activeSize: const Size(18.0, 9.0),
       activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
     ) ,
     );
     }),
    
 
   //popular text
   SizedBox(height: Dimensions.height30,),
    Container(
      margin: EdgeInsets.only(left: Dimensions.width30,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Trending!"),
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
    
     
      GetBuilder<ProductController>(builder:(products)
      {
        return products.isLoaded?ListView.builder(
        physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.ProductList.length,
      itemBuilder: (context,index){
      return GestureDetector(
        onTap: ()
        {
          Get.toNamed(RouteHelper.getProduct(index,"home"));
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
    }):CircularProgressIndicator
    (
      color: AppColors.mainColor,
    );
      }),
    
     ], 
    ); }
  Widget _buildPageItem(int index,CategoryModel category){
   Matrix4 matrix = Matrix4.identity();
   if(index==_currentPageValue.floor()){
     var currScale = 1-(_currentPageValue-index)*(1-ScaleFactor);
     var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
   } else if(index==_currentPageValue.floor()+1){
     var currScale = ScaleFactor+(_currentPageValue-index+1)*(1-ScaleFactor);
      var currTrans = _height*(1-currScale)/2; 
           matrix = Matrix4.diagonal3Values(1, currScale, 1);
            matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else if(index==_currentPageValue.floor()-1){
     var currScale = 1-(_currentPageValue-index)*(1-ScaleFactor);
           var currTrans = _height*(1-currScale)/2; 

           matrix = Matrix4.diagonal3Values(1, currScale, 1);
            matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
   }else{
     var currScale= 0.8;
                matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-ScaleFactor)/2, 1);

   }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: ()
        {
          Get.toNamed(RouteHelper.getCategory(index));
        },
            child: Container(            
                    height: Dimensions.pageViewContainer,
                    margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xff69c5df) : Color(0xff9294cc),
              image : DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConsts.BASE_URI+"/"+category.image!),
              )
                   ),
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
          )
        ],
      ),
    );
  }
}