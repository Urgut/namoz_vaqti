import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/local_notifications.dart';
import 'package:namaz_vakitleri_app/screens/homepage.dart';
import 'package:namaz_vakitleri_app/screens/selectCountry.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  preferences = await SharedPreferences.getInstance();
  LocalNotifications().initializing();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Namaz Vakitleri Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: preferences.getBool("selectedInfo") == true
          ? HomePage(title: 'Namaz Vakitleri Uygulaması')
          : SelectCountry(),
    );
  }
}
