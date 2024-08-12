class UserModel
{
   int? id;
   String? name;
    String? email;
    String ?image;
   
UserModel(
  {
required this.id,
required this.name,
required this.email,
required this.image,
  });
   
 factory UserModel.fromJson(Map<String,dynamic> json)
  {
    return UserModel(
      id: json['id'],
       name: json['name'],
        email: json['email'],
         image: json['image']);
         
     
  }
  // UserModel.fromJson(Map<String,dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  // email = json['email'];
  //   image = json['image'];
  // }


}


