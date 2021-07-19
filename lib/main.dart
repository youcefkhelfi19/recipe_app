import 'package:flutter/material.dart';
import 'package:recipe_app/global_servvices/app_colors.dart';

import 'auth_screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
