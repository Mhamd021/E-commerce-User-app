// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/base/show_custom_snackbar.dart';
import 'package:sampleproject/controllers/auth_controller.dart';
import 'package:sampleproject/models/signup_body_model.dart';
import 'package:sampleproject/pages/auth/sign_up_page.dart';
import 'package:sampleproject/pages/home/main_page.dart';
import 'package:sampleproject/routes/route_helper.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/big_text.dart';
import '../../widgets/app_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
      void _login()
    {
      
      var authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

    
       if (email.isEmpty)
      {
                showCustomSnackBar("Type in your email",title: "Email");
      }
       else if (!GetUtils.isEmail(email))
      {
        showCustomSnackBar("Type in a valid email",title: "Valid email");

      }
      else if (password.isEmpty)
      {
        showCustomSnackBar("Type in your password",title: "Password");

      }
     
      else
      {
           
                authController.login(email,password).then((status)
                {
                  if(status.isSuccess)
                  {
                    showCustomSnackBar("All went well",title: "Perfect");
                    print("Success login");
                   Get.offNamed(RouteHelper.getInitial());
                  }
                  else
                  {
                    showCustomSnackBar(status.message);
                  }
                }
                );
      }

     }
      return Scaffold
    (
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: 
          [
            SizedBox(height: Dimensions.screenHeight/5),
            //app logo
            Container
            (
              height: Dimensions.screenHeight*0.2,
              child: Center(
                child: CircleAvatar
                (
                  backgroundColor: Colors.white,
                  radius:80 ,
                  backgroundImage: AssetImage
                  (
                    "assets/image/pngtest.png"
                  ) ,
                ),
              ),
            ),
         Container
         (
          margin: EdgeInsets.only(left:Dimensions.width20),
          width: double.maxFinite,
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              Text(
                "Hello",
                style: TextStyle
                (
                  fontSize: Dimensions.font20*3+Dimensions.font20/2,
                  fontWeight: FontWeight.bold, 
                ),
                ),
                 Text(
                "Sign Into your account",
                style: TextStyle
                (
                  fontSize:Dimensions.font20,
                  color: Colors.grey[500],
                ),
                ),
                
            ],
          ),
         ),
         SizedBox(height: Dimensions.height20,),
            //email
             AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimensions.height20,),
            //password
             AppTextField(textController:  passwordController, hintText: "Password", icon: Icons.password_sharp,isObs: true,),
            SizedBox(height: Dimensions.height20,),
            //sign in button
            GestureDetector(
              onTap:()
              {
                  _login();
              },
              child: Container
              ( 
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
               decoration: BoxDecoration
               (
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
               ),
               child: Center(
                 child: BigText(
                  text: "Sign In",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,
                  
                  ),
               ),
              ),
            ),
                      SizedBox(height: Dimensions.height10,),
                      RichText(
                        text: TextSpan
                        (
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(() =>SignUpPage() ,transition: Transition.fade) ,
                          text: "Dont Have an account ?",
                          style: TextStyle
                          (
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          )
                        )
                        )
          ],
        ),
      )
    );

  }
}