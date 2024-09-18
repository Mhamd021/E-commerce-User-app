class Product {
  bool? _success;
  late List<ProductModel> _products;
  String? _message;
  List<ProductModel> get products=>_products;

  Product({ required success, required products, required message})
  {
    _success=success;
    _products=products;
    _message=message;

  }

  Product.fromJson(Map<String, dynamic> json) {
    _success = json["success"];
    if (json["data"] != null) {
      _products = <ProductModel>[];
      json["data"].forEach((v) {
        _products.add( ProductModel.fromJson(v));
      });
    }
    _message = json["message"];
  }

 
}

class ProductModel {
  int? id;
  int? storeId;
  String? name;
  int? price;
  String? category;
  String? detail;
  String? image;

  ProductModel(
      {this.id,
      this.storeId,
      this.name,
      this.price,
      this.category,
      this.detail,
      this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    detail = json['detail'];
    image = json['image'];
  }

  
}