import 'package:get/get.dart';
import 'package:sampleproject/helper/category_repo.dart';
import 'package:sampleproject/models/category_model.dart';

class CategoryController extends GetxController 
{
    final CategoryRepo categoryRepo;
    CategoryController({required this.categoryRepo});
    List<dynamic> _categoryList=[];
    List<dynamic> get categoryList =>_categoryList;
  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded; 
    Future<void> getcategorylist() async
  {
      Response response = await categoryRepo.getcategorylist(); 
     if(response.statusCode==200)
     {
      print("Categories");
      _categoryList=[];
      _categoryList.addAll(Category.fromJson(response.body).categories);
      _isLoaded=true;
      update(); 
     }
     else
     {
       print("Categories not ");
     }
  }
}