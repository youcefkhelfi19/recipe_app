import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/global_servvices/app_colors.dart';

class CategoryCard extends StatelessWidget {
   CategoryCard({this.name,this.image});
  final String name ;
  final String image;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
              radius: screenWidth * 0.1,
              backgroundColor: AppColors.purple2,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.purple4,
                        AppColors.purple3,
                        AppColors.purple2,
                        AppColors.purple1,
                      ],
                      begin: const FractionalOffset(0.1, 1),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.25, 0.5, 0.75, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image(
                  image: AssetImage(image),
                ),
              )),
          AutoSizeText(
            name,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
