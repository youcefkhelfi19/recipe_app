import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/global_services/app_colors.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.width,this.height,this.onPressed,this.text});
   final Function onPressed;
   final String  text ;
   final double height;
   final double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
         height: height,
        minWidth: width,
        color: AppColors.purple2,

      onPressed: onPressed,
      child:  AutoSizeText(text,
      style: TextStyle(color: Colors.white,fontSize: 18.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
