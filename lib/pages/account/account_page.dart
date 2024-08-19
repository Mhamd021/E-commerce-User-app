import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/auth_controller.dart';
import 'package:sampleproject/controllers/user_controller.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/account_widget.dart';
import 'package:sampleproject/widgets/app_icon.dart';
import 'package:sampleproject/widgets/big_text.dart';

import '../../utili/app_consts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (usercontroller) {
          return _userLoggedIn
              ? (usercontroller.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                        top: Dimensions.height20,
                      ),
                      child: Column(
                        children: [
                         
                         APPIcon(
                                icon: Icons.person,
                                backgroundcolor: AppColors.mainColor,
                                iconcolor: Colors.white,
                                iconsize: Dimensions.height45+Dimensions.height30,
                                size: Dimensions.height15 * 10,
                              ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          AccountWidget(
                              appIcon: APPIcon(
                                icon: Icons.person,
                                backgroundcolor: AppColors.mainColor,
                                iconcolor: Colors.white,
                                iconsize: Dimensions.height10 * 2.5,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText: BigText(
                                text: "Mhamd",
                              )),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          AccountWidget(
                              appIcon: APPIcon(
                                icon: Icons.email,
                                backgroundcolor: AppColors.yellowColor,
                                iconcolor: Colors.white,
                                iconsize: Dimensions.height10 * 2.5,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText: BigText(
                                text: "Ahmad@gmail.com",
                              )),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Get.find<AuthController>().userLoggedIn()) {
                                Get.offNamed(RouteHelper.getSignIn());
                                Get.find<AuthController>().clearSharedData();
                              }
                            },
                            child: AccountWidget(
                                appIcon: APPIcon(
                                  icon: Icons.logout_outlined,
                                  backgroundcolor: AppColors.iconColor2,
                                  iconcolor: Colors.white,
                                  iconsize: Dimensions.height10 * 2.5,
                                  size: Dimensions.height10 * 5,
                                ),
                                bigText: BigText(
                                  text: "Logout",
                                )),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 12,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/image/pngtest.png"))),
                        ),
                        SizedBox(height: Dimensions.height10,),
                        GestureDetector(
                          onTap: ()
                          {
                            Get.toNamed(RouteHelper.getSignIn());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 *5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(child: BigText(text: "SignIN",color: Colors.white,size: Dimensions.font26,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
