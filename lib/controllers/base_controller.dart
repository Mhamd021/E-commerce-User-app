import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin BaseController 
{
void showloading()
{
  Get.dialog
  (
    Dialog
    (
        insetPadding: EdgeInsets.symmetric(horizontal: 150),
        backgroundColor: Colors.white.withOpacity(.9),
        child: Container
        (
          height: 80,
          width: 5,
          child: Center
          (
            child: CircularProgressIndicator(),
          ),
        ),
    ),
    barrierDismissible: false,
  );
}//end of showloading

void closeLoading()
{
  if(Get.isDialogOpen!)
  {
    Get.back();
  }
}//end of closeloading

}//end of controller