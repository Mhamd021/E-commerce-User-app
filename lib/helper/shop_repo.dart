import 'package:get/get.dart';
import 'package:sampleproject/utili/app_consts.dart';

import '../data/api/api.dart';

class ShopRepo extends GetxService
{
  final Api api;
  ShopRepo({required this.api});
  Future<Response> getshoplist() async
  {
      return await api.getData(AppConsts.SHOP_URI);
  }

}