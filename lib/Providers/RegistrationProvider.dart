import 'package:flutter/cupertino.dart';
import 'package:try1_holistic_randomuser/Models/registration%20model.dart';
import 'package:try1_holistic_randomuser/Services/RegistrationService.dart';

class RegistrationProvider extends ChangeNotifier{
  RegistrationModel? registrationModel;
  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  })async{
    registrationModel = await RegistrationService.signup(name: name, email: email, phone: phone, password: password);
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  })async{
    registrationModel = await RegistrationService.login( email: email, password: password);
    notifyListeners();
  }
}