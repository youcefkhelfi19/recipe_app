import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/global_services/app_colors.dart';

class FeedsCard extends StatelessWidget {
  final String title;
  final String description;
  final String image ;
  final bool isFavorite;
  final bool isSaved ;
  FeedsCard({this.isFavorite = false,this.title,this.description,this.image,this.isSaved= false});
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        children: [
          Container(
            width: screenWidth * 0.95,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Column(
                children: [
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.white60,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    badgeContent: Icon(
                      isSaved ?Icons.bookmark: Icons.bookmark_border,
                      color: AppColors.purple2,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: screenWidth * 0.95,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(-1.0, -1),
                      end: Alignment(-1.0, 1),
                      colors: [
                        Colors.transparent,
                        Colors.black12,
                        Colors.black26,
                        Colors.black38,
                        Colors.black45,
                        Colors.black54,
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        AutoSizeText(
                          description,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(isFavorite ? Icons.favorite:Icons.favorite_border,color: Colors.red,),
                        AutoSizeText('50',style: TextStyle(color: Colors.white,fontSize: 12.0),)
                      ],
                    )
                  ],
                ),
              ),
          ),

        ],
      ),
    );
  }
}
