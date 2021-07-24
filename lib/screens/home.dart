import 'package:auto_size_text/auto_size_text.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_app/app_data/feeds_data.dart';
import 'package:recipe_app/global_services/app_colors.dart';
import 'package:recipe_app/app_data/categories_data.dart';
import 'package:recipe_app/screens/profile.dart';
import 'package:recipe_app/widgets/category_card.dart';
import 'package:recipe_app/widgets/feeds_card.dart';

class Home extends StatelessWidget {
 final List categories = CategoriesData().categories;
 final List  feed = FeedsData().feeds;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return BackdropScaffold(
      frontLayerBorderRadius: BorderRadius.circular(0.0),
      appBar: BackdropAppBar(
        title: AutoSizeText('Book'),
        centerTitle: true,
        leading: BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        actions: <Widget>[

          IconButton(
              icon:Icon(FontAwesome.comment),
              onPressed:(){

              }),
        ],
      ),
        backLayer: Profile(),

        frontLayer: Scaffold(

          body: Column(
             children: [
               Container(

                 margin: EdgeInsets.only(top: 10 ,left:10,bottom: 10),
                 padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [
                       Colors.black12,
                       Colors.black26,
                     ],
                   ),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(40.0),
                       topLeft: Radius.circular(40.0)

                 )
                 ),
                 child: TextFormField(
                   style: TextStyle(color: Colors.white),
                   decoration: InputDecoration(
                       fillColor: AppColors.purple2,
                       prefixIcon: Icon(Icons.search,color: Colors.white,),
                       hintText: 'Search',
                       hintStyle: TextStyle(color: Colors.white),

                       filled: true,
                       border: OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.white,
                               width: 20
                           ),
                           borderRadius: BorderRadius.circular(30.0),

                       )
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0,bottom: 5.0),
                 child: Align(
                     alignment: Alignment.bottomLeft,
                     child: AutoSizeText('Categories',
                     style: TextStyle(
                       fontSize: 18.0,
                       fontWeight: FontWeight.bold,
                     ),
                     )),
               ),
               Container(
                 padding: EdgeInsets.only(left: 10,right: 10.0),
                 width: screenWidth,
                 height: screenHeight*0.12,
                 child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                     itemCount: categories.length,
                     itemBuilder: (context,index){
                       return CategoryCard(
                         name: categories[index]['name'],
                         image: categories[index]['image'],
                       );
                     }),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: Align(
                     alignment: Alignment.bottomLeft,
                     child: AutoSizeText('Feeds',
                       style: TextStyle(
                         fontSize: 18.0,
                         fontWeight: FontWeight.bold,
                       ),
                     )),
               ),
               Expanded(
                 child: Container(
                     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                     child: ListView.builder(
                      itemCount:feed.length ,
                     itemBuilder: (context , index){
                        return FeedsCard(
                          title: feed[index]['title'],
                          description: feed[index]['description'],
                          image: feed[index]['image'],
                          isFavorite: feed[index]['favorite'],
                          isSaved: feed[index]['saved'],
                        );
                     })

                 ),
               )
             ],
          )
        ));
  }
}
