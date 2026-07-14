class Usermodel {
  String? token;
  Usermodel({this.token});
  Usermodel.fromJson(Map<String,dynamic>json){
    token = json['token'];
  }
}