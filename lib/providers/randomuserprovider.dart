import 'package:flutter/cupertino.dart';
import 'package:untitled/models/randomusermodel.dart';
import 'package:untitled/services/randomuserservice.dart';

class RandomUserProvider extends ChangeNotifier
{
  RandomUserModel? randomUserModel;
  Future<void> fetchdata() async
  {
    randomUserModel = await RandomUserService.getdata();
    notifyListeners();
  }
}