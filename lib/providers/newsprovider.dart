import 'package:flutter/cupertino.dart';
import 'package:untitled/models/newsmodel.dart';
import 'package:untitled/services/newsservice.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel? newsModel;
  Future<void> fetchdata() async {
    newsModel= await NewsService.getdata();
    notifyListeners();
  }
}