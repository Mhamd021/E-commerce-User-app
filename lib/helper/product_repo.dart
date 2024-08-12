import 'package:get/get.dart';
import 'package:sampleproject/data/api/api.dart';
import 'package:sampleproject/utili/app_consts.dart';

class ProductRepo extends GetxService
{
  final Api api;
  ProductRepo({required this.api});
  Future<Response> getProductList() async
  {
      return await api.getData(AppConsts.PRODUCTS_URI);
  }


}