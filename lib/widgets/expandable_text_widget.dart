import 'package:flutter/material.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/small_text.dart';

class ExpandableTextWidget  extends StatefulWidget
 {
  final String text;
  const ExpandableTextWidget ({ Key? key,required this.text }) : super(key: key);

  @override
   State<ExpandableTextWidget> createState() => _State();
}

class _State extends State<ExpandableTextWidget> 
{
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
   
  double textHieght = Dimensions.screenHeight/5.63;

  @override
  void initState(){
  
  super.initState();
  if(widget.text.length>textHieght)
  {
    firstHalf = widget.text.substring(0,textHieght.toInt());
    secondHalf = widget.text.substring(textHieght.toInt()+1, widget.text.length);
      
  }
  else
  {
    firstHalf = widget.text;
    secondHalf = "";   
  }

  }


  @override
  Widget build(BuildContext context) {
    return Container
    (
      child: secondHalf.isEmpty?SmallText(color:AppColors.pargColor, size: Dimensions.font16, text: firstHalf):Column
      (
        children:
        [
          SmallText(height: 1.8, color:AppColors.pargColor , size: Dimensions.font16, text: hiddenText?(firstHalf+"...."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
            setState(() {
              hiddenText=!hiddenText;
            });
            } ,
            child: Row(
              children: [
                SmallText(text: "Show more",color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down,color: AppColors.mainColor,),

              ],
            ),
          )
        ],
      ),
    );
  }// 4:24:46
}