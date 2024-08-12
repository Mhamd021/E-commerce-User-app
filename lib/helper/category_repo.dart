import 'package:get/get.dart';
import 'package:sampleproject/utili/app_consts.dart';

import '../data/api/api.dart';

class CategoryRepo extends GetxService
{
  final Api api;
  CategoryRepo({required this.api});
  Future<Response> getcategorylist() async
  {
      return await api.getData(AppConsts.CATEGORY_URI);
  }

}