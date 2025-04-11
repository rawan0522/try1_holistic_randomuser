import 'package:dio/dio.dart';
import 'package:try1_holistic_randomuser/Models/UserModel.dart';
class UserService{
  static Dio dio = Dio();
static Future<UserModel>getusers()async{
  String url = "https://randomuser.me/api/?results=100";
  var response = await dio.get(url);
  if(response.statusCode == 200){
    print(response.data);
    return UserModel.fromjson(response.data);
  }
  else{
    throw Exception('Error fetching users');
  }
}
}