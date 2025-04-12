import 'package:flutter/material.dart';
import 'package:untitled/models/bmimodel.dart';

class BMIProvider extends ChangeNotifier {
  BMIModel? result;

  void calculateBMI({required double weight, required double height}) {
    double heightInMeters = height / 100;
    double bmiValue = weight / (heightInMeters * heightInMeters);
    String status;

    if (bmiValue < 18.5) {
      status = "Underweight";
    } else if (bmiValue < 25) {
      status = "Normal";
    } else if (bmiValue < 30) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    result = BMIModel(bmi: bmiValue, status: status);
    notifyListeners();
  }
}
