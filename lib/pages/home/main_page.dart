// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:sampleproject/pages/home/home_page_body.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';
import '../../controllers/product_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _State();
}

class _State extends State<MainPage> {
  Future<void> _LoadResource() async {
    await Get.find<CategoryController>().getcategorylist();
    await Get.find<ProductController>().getProductList();
  }

  @override
  Widget build(BuildContext context) {
    print("current height is" + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        child: Column(
          children: [
            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Welcome",
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                        Row(
                          children: [
                            //   SmallText(text: " Provider ", color: Colors.black54, size: 15,),
                            //    Icon(Icons.arrow_drop_down_circle_outlined)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //showing the body
            Expanded(
                child: SingleChildScrollView(
              child: HomePageBody(),
            ))
          ],
        ),
        onRefresh: _LoadResource);
  }
}
