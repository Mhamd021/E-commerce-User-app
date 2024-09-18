import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import '../../base/show_custom_snackbar.dart';
import '../../utili/app_consts.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart'; 

class CheckoutOrder extends StatefulWidget {
  const CheckoutOrder({ Key? key }) : super(key: key);

  @override
  State<CheckoutOrder> createState() => _CheckoutOrderState();
}

class _CheckoutOrderState extends State<CheckoutOrder> {
    TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Submit Order'),
      ),
      body: Stack(
        children: [
         Column
         (
children: 
[
   Container(
    decoration: BoxDecoration
    (
      borderRadius: BorderRadius.circular(Dimensions.radius30),
    ),
            height: Dimensions.pageViewContainer,
            child: FlutterMap(
              
              options: MapOptions(
                
              onTap: (tapPosition, point) 
              {
                Get.toNamed(RouteHelper.getMap());
              } ,
             
                minZoom: 5,
                maxZoom: 18,
                zoom: 13,
                center: AppConsts.myLocation,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a','b','c'],
                      // "https://api.mapbox.com/styles/v1/don21/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}"
                  // additionalOptions: {
                  //   'mapStyleId': AppConsts.mapBoxStyleId,
                  //   'accessToken': AppConsts.mapBoxAccessToken,
                  // },
                ),
              ],
            ),
          ),
           SizedBox(height: Dimensions.height20,),
            //email
             AppTextField(textController: emailController, hintText: "Phone Number", icon: Icons.phone),
            SizedBox(height: Dimensions.height20,),
            //password
             ElevatedButton(
              onPressed: _selectTime,
              child: const Text('SELECT TIME'),
            ),
            const SizedBox(height: 5),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
            SizedBox(height: Dimensions.height20,),
          Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
               GestureDetector(
                onTap: ()
                {
                  showCustomSnackBar("Order Placed",title: "Perfect");
                  Get.toNamed(RouteHelper.getInitial());
                },
                 child: Container
                             ( 
                  width: Dimensions.screenWidth/3,
                  height: Dimensions.screenHeight/16,
                 decoration: BoxDecoration
                 (
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                 ),
                 child: Center(
                   child: BigText(
                    text: "Submit",
                    size: Dimensions.font20,
                    color: Colors.white,
                    
                    ),
                 ),
                             ),
               ),
               GestureDetector(
                onTap: ()
                {
                  Get.toNamed(RouteHelper.getCart());
                },
                 child: Container
                             ( 
                  width: Dimensions.screenWidth/3,
                  height: Dimensions.screenHeight/16,
                 decoration: BoxDecoration
                 (
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.signColor,
                 ),
                 child: Center(
                   child: BigText(
                    text: "Cancel",
                    size: Dimensions.font20,
                    color: Colors.white,
                    
                    ),
                 ),
                             ),
               ),
            ],
          ),
],
         ),
        ],
      ),
    );
  }
}