class SignUpBody 
{

  String name;
  String email;
  String password;
  String passwordconfirmation;
  SignUpBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordconfirmation,
  });

Map<String,dynamic> toJson()
{
  final Map<String, dynamic> data =  <String,dynamic>{};
  data['name'] = name;
  data['email'] = email;
  data['password'] = password;
  data['password_confirmation'] = passwordconfirmation;
  return data;
}


}