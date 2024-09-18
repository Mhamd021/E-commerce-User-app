// ignore_for_file: constant_identifier_names

import 'package:latlong2/latlong.dart';
class AppConsts 
{
    static const String BASE_URI = "http://192.168.1.12:8000" ; 

  static const String Registration_URI = "/api/register" ; 
  static const String Login_URI = "/api/login" ; 
  static const String SHOP_URI = "/api/shops";
  static const String PRODUCTS_URI = "/api/products";
  static const String CATEGORY_URI = "/api/categories"; 
  static const String CATEGORY_ALL_URI = "/api/Allcategories";
    static const String USER_INFO_URI = "/api/user";
    static const String Orders = "/api/user";
  static const String CATEGORY_PRODUCTS_URI = "/api/CategoryProducts/"; 
  static const String TOKEN = "" ; 
static const String mapBoxAccessToken  = "pk.eyJ1IjoiZG9uMjEiLCJhIjoiY2xramN3d2RkMHRsNzNwa2dmdnIyZnBxMiJ9.ZXAz_MdYN4tANHbAALm5KQ"; 
    static const String mapBoxStyleId  = "clkjprl8j001t01pe673277ly" ; 
    static final myLocation = LatLng(35.059125, 36.340569);

}