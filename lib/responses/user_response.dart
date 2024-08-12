
import 'package:sampleproject/models/user_model.dart';

class UserResponse
{
  late UserModel user;
  late String? token ;

  UserResponse.fromJson(Map<String,dynamic> json)
  {
    user = UserModel.fromJson(json['data']['user']);
    token = json['data']['token'];
     
  }

}