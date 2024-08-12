import 'package:get/get.dart';
import 'package:sampleproject/controllers/auth_controller.dart';
import 'package:sampleproject/controllers/cart_controller.dart';
import 'package:sampleproject/controllers/product_controller.dart';
import 'package:sampleproject/controllers/user_controller.dart';
import 'package:sampleproject/data/api/api.dart';
import 'package:sampleproject/helper/auth_repo.dart';
import 'package:sampleproject/helper/cart_repo.dart';
import 'package:sampleproject/helper/product_repo.dart';
import 'package:sampleproject/helper/shop_repo.dart';
import 'package:sampleproject/helper/user_repo.dart';
import 'package:sampleproject/utili/app_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/category_controller.dart';
import '../controllers/shop_controller.dart';
import 'category_repo.dart';

Future<void> init() async 
{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => Api(appBaseUrl: AppConsts.BASE_URI,sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo(api: Get.find(), sharedPreferences:Get.find() ));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CartRepo());
  Get.lazyPut(() => CartControler(cartRepo: Get.find()));
  Get.lazyPut(() => ProductRepo(api: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => ShopRepo(api: Get.find()));
  Get.lazyPut(() => ShopController(shopRepo: Get.find()));
  Get.lazyPut(() => CategoryRepo(api: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
  Get.lazyPut(() => UserRepo(api: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));





}