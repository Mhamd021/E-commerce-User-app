import 'package:sampleproject/models/product_model.dart';

class CartModel 
{
  int? id;
  int? store_id;
  String? name;
  int? price;
  String? image;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
     this.id,
    this.store_id,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.isExist,
    this.time,
    this.product

  });
  CartModel.fromJson(Map<String,dynamic> json ) 
  {
    id = json["id"];
    store_id = json["store_id"];
    name = json["name"];
    price = json["price"];
    image = json["image"];
    quantity = json["quantity"];
    isExist = json["isExist"];
    time = json["time"];
    product = ProductModel.fromJson(json["product"]);



  }

}