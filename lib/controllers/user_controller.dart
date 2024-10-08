import 'package:get/get.dart';
import 'package:sampleproject/helper/user_repo.dart';
import 'package:sampleproject/models/user_model.dart';

import '../models/response_model.dart';

class UserController extends GetxController implements GetxService
{

  final UserRepo userRepo;
  UserController({
      required this.userRepo
  });

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel>getUserInfo() async
  {
    _isLoading = true;
   Response response = await  userRepo.getUserInfo();
   late ResponseModel responseModel;
   if(response.statusCode==200)
   {
    _userModel = UserModel.fromJson(response.body);
    responseModel = ResponseModel(true, "successfuly");
   }
   else
   {
    responseModel = ResponseModel(false, response.statusText!);

   }
   _isLoading = false;
   update();
   return responseModel;
  }
  

 
}
