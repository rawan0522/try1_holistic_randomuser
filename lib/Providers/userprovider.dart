import 'package:flutter/cupertino.dart';
import 'package:try1_holistic_randomuser/Models/UserModel.dart';
import 'package:try1_holistic_randomuser/Services/UserService.dart';

class UserProvider extends ChangeNotifier{
  UserModel? userModel;
  Future<void> fetchUsers() async{
    userModel = await UserService.getusers();
    notifyListeners();
  }
}