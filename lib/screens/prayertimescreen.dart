import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/prayertimeprovider.dart';
import 'package:untitled/widgets/prayertimewidget.dart';

class PrayertimeScreen extends StatelessWidget {
  const PrayertimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prayer Times"),
      ),
      body: Center(
        child: Consumer<PrayertimeProvider>(
          builder: (context, value, child) {
            var prayerr = value.prayertimeModel;
            if (prayerr == null) {
              value.fetchdata();
              return Center(child: CircularProgressIndicator());
            }
            else {
              return ListView.builder(itemBuilder: (context, index) {
                var name = prayerr.timings.keys;
                var time = prayerr.timings.values;
                return PrayertimeWidget(
                    prayer: name.elementAt(index),
                    prayertime: time.elementAt(index)
                );
              },
                itemCount: 10,
              );
            }
          },
        ),
      ),
    );
  }
}
