import 'package:dio/dio.dart';
import 'package:try1_holistic_randomuser/Models/registration%20model.dart';
class RegistrationService{
  static Dio dio = Dio();
  static Future<RegistrationModel> signup({required String name,
    required String email,
    required String phone,
    required String password,})async{
    String url = "https://elsewedyteam.runasp.net/api/Register/AddUser";
        var response = await dio.post(url , data: {
          "Name": name,
          "Password":password,
          "Email":email,
          "Phone":phone
        });
        if(response.statusCode == 200){
          return RegistrationModel.fromjson(response.data);
        }
        else{
          throw Exception('Error fetching users');
        }
  }

  static Future<RegistrationModel>login({required String email, required String password,})async{
    String url = "https://elsewedyteam.runasp.net/api/Login/CheckUser";
    var response = await dio.post(url ,  data: {
    "Password":password,
    "Email":email,
    });
    if(response.statusCode == 200){
      return RegistrationModel.fromjson(response.data);
    }
    else{
      throw Exception('Error fetching users');
    }

  }

}