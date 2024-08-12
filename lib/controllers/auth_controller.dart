
import 'package:get/get.dart';
import '../helper/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';


class AuthController extends GetxController implements GetxService
{

// var isLoggedIn = false.obs;

// var user = User().obs;
// @override
// void onInit() {
//     super.onInit();
//     redirect();
//   }

//    Future<void> redirect() async
//   {
//       var token =await GetStorage().read('login_token');

//       if(token!=null)
//       {
//         isLoggedIn.value = true;
//       }

//       Get.off(MainPage());

    
//   }

//   Future<void> login({required Map<String,dynamic> loginData}) async 
//   {
//     showloading();
//     var response = await ApiClient.login(loginData: loginData);
//     var userResponse = UserResponse.fromJson(response.data);
//     await GetStorage().write('login_token', userResponse.token);
//     user.value = userResponse.user;

//     isLoggedIn.value = true; 
//     update();
//     closeLoading();
//     Get.offAll(() =>MainPage());

//   }

 

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