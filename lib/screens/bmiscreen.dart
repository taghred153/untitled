import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/bmiprovider.dart';

class BMIScreen extends StatelessWidget {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Weight (kg)"),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Height (cm)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double weight = double.tryParse(weightController.text) ?? 0;
                double height = double.tryParse(heightController.text) ?? 0;
                if (weight > 0 && height > 0) {
                  Provider.of<BMIProvider>(context, listen: false)
                      .calculateBMI(weight: weight, height: height);
                }
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 30),
            Consumer<BMIProvider>(
              builder: (context, value, child) {
                if (value.result == null) return const Text("Enter your data");
                return Column(
                  children: [
                    Text("BMI: ${value.result!.bmi.toStringAsFixed(2)}"),
                    Text("Status: ${value.result!.status}"),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
