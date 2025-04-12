import 'package:flutter/material.dart';
import 'package:untitled/models/prayertimemodel.dart';
import 'package:untitled/services/prayertimeservice.dart';

class PrayertimeProvider extends ChangeNotifier
{
  PrayertimeModel? prayertimeModel;
  Future<void> fetchdata() async
  {
    prayertimeModel = await PrayertimeService.getdata();
    notifyListeners();
  }
}