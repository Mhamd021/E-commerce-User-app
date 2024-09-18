import 'package:get/get.dart';
import 'package:sampleproject/models/signup_body_model.dart';
import 'package:sampleproject/utili/app_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api.dart';

class AuthRepo 
{

      final Api api ; 
      final SharedPreferences sharedPreferences ; 
      
      AuthRepo(
        {
        required this.api,
        required this.sharedPreferences,
        });
        Future<String> getUserToken()
        async {
          return  sharedPreferences.getString(AppConsts.TOKEN)??"None";
        }
        bool userLoggedIn()
        {
          return  sharedPreferences.containsKey(AppConsts.TOKEN);
        }
        
        Future<Response> registration(SignUpBody signUpBody) async
        {
           return await api.postData(AppConsts.Registration_URI,signUpBody.toJson());
        }
          Future<Response> login(String email,String password) async
        {
           return await api.postData(AppConsts.Login_URI,{"email":email,"password":password});
        }
        Future<bool>saveUserToken(String token) async
        {
          api.token = token ; 
          api.updateHeader(token);
          return await sharedPreferences.setString(AppConsts.TOKEN, token);
        }

        bool clearSharedData() 
        {
          sharedPreferences.remove(AppConsts.TOKEN);
          api.token = '';
          api.updateHeader('');
          return true;
        }


}