import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.image,this.onPressed,this.width,this.height});
  final String image;
  final Function onPressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      highlightColor: Colors.white,
      height: height,
      minWidth: width,
      color: Colors.white60,

      onPressed: onPressed,
      child: Image.asset(image,
      height: height-10,
        width: width-10,
      ),
      shape: CircleBorder()
    );
  }
}
