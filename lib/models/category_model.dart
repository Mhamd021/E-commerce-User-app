class Category {
  bool? _success;
  late List<CategoryModel> _categories;
  String? _message;
    List<CategoryModel> get categories => _categories;

  Category({ required success, required categories,  required message})
  {
      this._success = success;
      this._categories = categories;
      this._message = message;
  }

  Category.fromJson(Map<String, dynamic> json) {
    _success = json["success"];
    if (json["data"] != null) {
      _categories = <CategoryModel>[];
      json["data"].forEach((v) {
        _categories.add(CategoryModel.fromJson(v));
      });
    }
    _message = json["message"];
  }


}

class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({
    this.id,
      this.name,
       this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

 
}