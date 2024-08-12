import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/helper/cart_repo.dart';
import 'package:sampleproject/models/product_model.dart';

import '../models/cart_model.dart';
import '../utili/colors.dart';

class CartControler extends GetxController
{
    final CartRepo cartRepo;
    CartControler({required this.cartRepo});
    Map<int,CartModel> _items = {};
    Map<int,CartModel> get items =>_items;

    void addItem(ProductModel product,int quantity) 
    {
      var totalQuantity = 0;
      if(_items.containsKey(product.id!))
      {
        _items.update(product.id!, (value) 
        {
          totalQuantity = value.quantity!+quantity;
          return CartModel
          (
            id: value.id,
            store_id: product.storeId,
            name: product.name,
            price: product.price,
            image: product.image,
            quantity: value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product
          );
        });
        if(totalQuantity<=0)
        {
          _items.remove(product.id);
        }
      }
      else
      {
          if(quantity>0)
          {
             _items.putIfAbsent(product.id!, () => CartModel
    (
      id: product.id,
      store_id: product.storeId,
      name: product.name,
      price: product.price,
      image: product.image,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString(),
       product: product
    )
    );
          }
          else
          {
                 Get.snackbar("Item count", "you should at least ad one item !",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
      );
          }
      }

    update();
    }
    bool existInCart(ProductModel product)
    {
      if(_items.containsKey(product.id))
      {
          return true;
      }
      return false;
    }
    int getQuantity(ProductModel product)
    
    {
      var quantity = 0;
      if(_items.containsKey(product.id))
      {
          _items.forEach((key, value) {
              if(key==product.id)
              {
                quantity=value.quantity!;
              }
           });

      }
      return quantity;
    }
    int get totalItems
    {
      var totalQuantity = 0;
      _items.forEach((key, value) {
        totalQuantity=totalQuantity+value.quantity!;
      });
      return totalQuantity;
    }
    List<CartModel> get getItems
    {
     return _items.entries.map((e) 
      {
       return e.value;
      }).toList();
    }
    int get totalAmount
    {
      var total =0;
      _items.forEach((key, value) {
        total += value.quantity!*value.price!;
      });
      return total;
    }
}
//10:28
