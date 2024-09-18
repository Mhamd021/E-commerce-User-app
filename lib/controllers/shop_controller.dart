import 'package:get/get.dart';
import 'package:sampleproject/helper/shop_repo.dart';
import 'package:sampleproject/models/shop_model.dart';

class ShopController extends GetxController 
{
    final ShopRepo shopRepo;
    ShopController({required this.shopRepo});
    List<dynamic> _shopList=[];
    List<dynamic> get shopList =>_shopList;
  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded; 
    Future<void> getshoplist() async
  {
      Response response = await shopRepo.getshoplist(); 
     if(response.statusCode==200)
     {
      print("object");
      _shopList=[];
      _shopList.addAll(Shop.fromJson(response.body).shops);
      _isLoaded=true;
      update(); 
     }
     else
     {
      
     }
  }
}