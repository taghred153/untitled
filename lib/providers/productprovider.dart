
import 'package:flutter/material.dart';
import 'package:untitled/models/productmodel.dart';
import 'package:untitled/services/productservice.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? productModel;
  Future<void> getAllProducts() async {
    productModel = await ProductServices.getAllProducts();
    notifyListeners();
  }
}