import 'package:auto_size_text/auto_size_text.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_app/screens/profile.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.grey[400],
          body: Center(child: Text('Book'),),
        ));
  }
}
