import 'package:flutter/material.dart';

class PrayertimeWidget extends StatelessWidget {
  final String prayer;
  final String prayertime;

  const PrayertimeWidget({
    super.key,
    required this.prayer,
    required this.prayertime
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black38,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(prayer,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(prayertime),
            ],
          ),
        ),
      ),
    );
  }
}
