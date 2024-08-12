
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';

import '../../base/show_custom_snackbar.dart';
import '../../utili/app_consts.dart';

class Map extends StatefulWidget {
  const Map({ Key? key }) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
    
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      
              
              options: MapOptions(
                
                
              onTap: (tapPosition, point) 
              {
           CircleMarker(point: point, radius: Dimensions.radius30,color: AppColors.mainColor);
           showCustomSnackBar("Location Saved",title: "Map");
           Get.toNamed(RouteHelper.getCheckOut());
           
           print(point);
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
                     
                ),
              
              ],
              
            );
  }
}