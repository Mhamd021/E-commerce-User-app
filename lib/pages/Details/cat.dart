
    

import 'package:flutter/material.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:sampleproject/widgets/small_text.dart';





class HomePageBody  extends StatefulWidget {
  final int pageId;
  const HomePageBody ({ Key? key ,required this.pageId}) : super(key: key);

  @override
  State<HomePageBody> createState() => _State();
}

class _State extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  
  double scaleFactor = 0.8;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
setState(() {
});
     });
  }
  @override
  void dispose(){
    super.dispose();
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