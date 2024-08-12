// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/base/show_custom_snackbar.dart';
import 'package:sampleproject/controllers/auth_controller.dart';
import 'package:sampleproject/models/signup_body_model.dart';
import 'package:sampleproject/pages/auth/sign_in_page.dart';
import 'package:sampleproject/utili/colors.dart';
import 'package:sampleproject/utili/dimensions.dart';
import 'package:sampleproject/widgets/big_text.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordconfirmationController = TextEditingController();

      void registration()
    {
      
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String password_confirmation = passwordconfirmationController.text.trim();

      if(name.isEmpty)
      {
        showCustomSnackBar("Type in your name",title: "Name");
      }
      else if (email.isEmpty)
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
       else if (password_confirmation.isEmpty)
      {
        showCustomSnackBar("Type in your password",title: "password_Confirmation");

      }
      else if (password.length<6)
      {
                showCustomSnackBar("Password cant be less than six characters",title: "Password");
      }
      else
      {
                
                SignUpBody signUpBody = SignUpBody
                (
                  name: name,
                  email: email,
                  password: password,
                  password_confirmation: password_confirmation
                  );
                authController.registration(signUpBody).then((status)
                {
                  if(status.isSuccess)
                  {
                    showCustomSnackBar("All went well",title: "Perfect");
                    print("Success Registration");
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
      body: SingleChildScrollView(
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
            //name
            AppTextField(textController: nameController, hintText: "Name", icon: Icons.person),
            SizedBox(height: Dimensions.height20,),
            //email
             AppTextField(textController: emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: Dimensions.height20,),
            //password
             AppTextField(textController:  passwordController, hintText: "Password", icon: Icons.password_sharp,isObs: true,),
            SizedBox(height: Dimensions.height20,),
            AppTextField(textController:  passwordconfirmationController, hintText: "PasswordConfirmation", icon: Icons.password_sharp,isObs: true,),
            SizedBox(height: Dimensions.height20,),
            //sign up button
            GestureDetector(
              onTap:()
              {
                registration();
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
                  text: "Sign up",
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
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(() =>SignInPage() ,transition: Transition.fade) ,
                          text: "Have an account already?",
                          style: TextStyle
                          (
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          )
                        )
                        )
          ],
        ),
      ),
    );

  }
}