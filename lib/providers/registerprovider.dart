import 'package:flutter/cupertino.dart';
import 'package:untitled/models/registermodel.dart';
import 'package:untitled/services/registerservice.dart';

class RegisterProvider extends ChangeNotifier
{
  RegisterModel? registerModel;
  Future<void> signupprovider({
    required String name,
    required String email,
    required String phone,
    required String password,
}) async{
    registerModel = await RegisterService.signupservice(
        name: name,
        email: email,
        phone: phone,
        password: password
    );
    notifyListeners();
  }
  Future<void> loginprovider({
    required String email,
    required String password,
}) async{
    registerModel = await RegisterService.loginservice(
        email: email,
        password: password
    );
    notifyListeners();
  }
}