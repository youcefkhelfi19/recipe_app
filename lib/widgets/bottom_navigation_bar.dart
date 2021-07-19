import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_app/global_servvices/app_colors.dart';
import 'package:recipe_app/screens/favorit.dart';
import 'package:recipe_app/screens/home.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({Key key}) : super(key: key);

  @override
  _BottomNaviBarState createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  List<Widget> tabs = [];
 int currentTabIndex = 0;
 @override
  void initState() {
    tabs = [Home(),Favorite()];

    super.initState();
  }
  void selectTab(int index){
   setState(() {
     currentTabIndex = index;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true ,
      body:tabs[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
      shape: CircularNotchedRectangle(),
        notchMargin: 12,
        elevation: 0.0,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,

          onTap: selectTab,
          currentIndex: currentTabIndex,
          items: [
            BottomNavigationBarItem(
              icon:Icon(FontAwesome.book),
              label: 'Book',
            ),


            BottomNavigationBarItem(
              icon:Icon(FontAwesome.bookmark),
              label: 'Saved',
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple2,
        child: Icon(FontAwesome.plus,),
        onPressed:(){

       },
      ),
    );
  }
}
