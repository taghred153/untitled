import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/bmiprovider.dart';
import 'package:untitled/providers/newsprovider.dart';
import 'package:untitled/providers/prayertimeprovider.dart';
import 'package:untitled/providers/productprovider.dart';
import 'package:untitled/providers/randomuserprovider.dart';
import 'package:untitled/providers/registerprovider.dart';
import 'package:untitled/providers/todolistprovider.dart';
import 'package:untitled/providers/weatherprovider.dart';
import 'package:untitled/screens/homescreen.dart';
import 'package:untitled/screens/loginscreen.dart';
import 'package:untitled/screens/prayertimescreen.dart';
import 'package:untitled/screens/randomuserscreen.dart';
import 'package:untitled/screens/searchweatherscreen.dart';
import 'package:untitled/screens/x%20o%20game.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ChangeNotifierProvider(create: (context) => PrayertimeProvider()),
      ChangeNotifierProvider(create: (context) => RandomUserProvider()),
      ChangeNotifierProvider(create: (context) => NewsProvider()),
      ChangeNotifierProvider(create: (context) => TaskProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => BMIProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}