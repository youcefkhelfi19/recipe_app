import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/global_services/app_colors.dart';

import 'auth_screens/login.dart';

void main() {
  //runApp(DevicePreview(builder: (context)=>MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       // builder:DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.purple2,
          scaffoldBackgroundColor: Colors.white,
          popupMenuTheme: PopupMenuThemeData(
            textStyle: TextStyle(color: Colors.white),
            color: AppColors.purple2,
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10.0)
            )
          ),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: AppColors.purple2
          ),
          canvasColor: AppColors.purple2,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.purple2,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(

          ),
          selectedItemColor: Colors.purpleAccent
        )
      ),
        home: Login());
  }
}
