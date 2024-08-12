import 'package:get/get.dart';
import 'package:sampleproject/utili/app_consts.dart';

import '../data/api/api.dart';

class UserRepo 
{
  final Api api;
  UserRepo({required this.api});

  Future<Response>getUserInfo()
  async {
   return await api.getData(AppConsts.USER_INFO_URI);
  }
}