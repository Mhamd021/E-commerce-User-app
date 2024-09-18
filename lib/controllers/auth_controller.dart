
import 'package:get/get.dart';
import '../helper/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';


class AuthController extends GetxController implements GetxService
{
  final AuthRepo authRepo;
  AuthController({
      required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel>registration(SignUpBody signUpBody) async
  {
    _isLoading = true;
   Response response = await  authRepo.registration(signUpBody);
   late ResponseModel responseModel;
   if(response.statusCode==200)
   {
    authRepo.saveUserToken(response.body["data"]["token"]);
    responseModel = ResponseModel(true, response.body["data"]["token"]);
   }
   else
   {
    responseModel = ResponseModel(false, response.statusText!);

   }
   _isLoading = false;
   update();
   return responseModel;
  }
   Future<ResponseModel>login(String email,String password) async
  {

    _isLoading = true;
   Response response = await  authRepo.login(email,password);
   late ResponseModel responseModel;
   if(response.statusCode==200)
   {
    
    authRepo.saveUserToken(response.body["data"]["token"]);
    print(response.body["data"]["token"]);
    responseModel = ResponseModel(true, response.body["data"]["token"]);
   }
   else
   {
    responseModel = ResponseModel(false, response.statusText!);
        
   }
   _isLoading = false;
   update();
   return responseModel;
  }

    bool userLoggedIn()
         {
          return  authRepo.userLoggedIn();
        }

        bool clearSharedData() {
          return authRepo.clearSharedData();
        }
}

//10:51