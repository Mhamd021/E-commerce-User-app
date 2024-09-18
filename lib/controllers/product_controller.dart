import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/controllers/cart_controller.dart';
import 'package:sampleproject/models/product_model.dart';
import 'package:sampleproject/utili/colors.dart';

import '../helper/product_repo.dart';
import '../models/cart_model.dart';

class ProductController extends GetxController 
{
    final ProductRepo productRepo;
    ProductController({required this.productRepo});
    List<dynamic> _productList=[];
    List<dynamic> get productList =>_productList;
    late CartControler _cart;
        bool _isLoaded = false;
    bool get isLoaded => _isLoaded;
    int _quantity = 0;

    

    int get  quantity=>_quantity;

    int _inCartItems=0;
    int get inCartItems=> _inCartItems+_quantity;
    Future<void> getProductList()async
    {
     Response response = await productRepo.getProductList(); 
     if(response.statusCode==200)
     {
      _isLoaded = true;
      print("got products");
      _productList=[];
      _productList.addAll(Product.fromJson(response.body).products);
      update(); 
     }
     else
     {
      
         
     }
    }


   void setQuantity(bool isIncrement) 
   {
    if(isIncrement)
    {
        _quantity = checkQuantity(_quantity+1);
    }
    else
    {
        _quantity =  checkQuantity(_quantity-1);

    }
    update();
   }
  int checkQuantity(int quantity)
   {
    if((_inCartItems+quantity)<0)
    {
      Get.snackbar("Item count", "you cant reduce more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      if(_inCartItems>0)
      {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0 ;
    }
    else if(_inCartItems+quantity>20)
    {
        Get.snackbar("Item count", "you cant add more !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
      return 20 ;
    }
    else 
    {
      return quantity;
    }
   }

   void initProduct( ProductModel product, CartControler cart)
   {
          _quantity=0;
          _inCartItems=0;
          _cart = cart;
          var exist = false;
          exist = _cart.existInCart(product);
         if(exist)
         {
          _inCartItems = cart.getQuantity(product);
         } 
   }

   void addItem(ProductModel product)
   {
   
        _cart.addItem(product, _quantity);
        _quantity=0;
        _inCartItems = _cart.getQuantity(product);

    update();
   }
   int get totalItems
   {
    return _cart.totalItems;
   }

    List<CartModel> get getItems
    {
      return _cart.getItems;
    }
   

}
//Nested Json key&value
