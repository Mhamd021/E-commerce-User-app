class SignUpBody 
{

  String name;
  String email;
  String password;
  String password_confirmation;
  SignUpBody({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

Map<String,dynamic> toJson()
{
  final Map<String, dynamic> data = new Map<String,dynamic>();
  data['name'] = this.name;
  data['email'] = this.email;
  data['password'] = this.password;
  data['password_confirmation'] = this.password_confirmation;
  return data;
}


}