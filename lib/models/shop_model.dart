class Shop {
  bool? _success;
  late List<ShopModel> _shops;
  String? _message;
    List<ShopModel> get shops => _shops;

  Shop({ required success, required shops,  required message})
  {
      this._success = success;
      this._shops = shops;
      this._message = message;
  }

  Shop.fromJson(Map<String, dynamic> json) {
    _success = json["success"];
    if (json["data"] != null) {
      _shops = <ShopModel>[];
      json["data"].forEach((v) {
        _shops.add(ShopModel.fromJson(v));
      });
    }
    _message = json["message"];
  }


}

class ShopModel {
  int? id;
  int? userId;
  String? name;
  String? image;

  ShopModel({
    this.id,
     this.userId,
      this.name,
       this.image});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    image = json['image'];
  }

 
}