
import 'package:flutter/material.dart';

class MenuItem{
 final String text ;
 final IconData icon ;
  MenuItem({this.text,this.icon});
}
class MenuItems{
 static List<MenuItem> items = [
    shareItem,editItem
  ];
  static MenuItem editItem = MenuItem(
    text: 'Edit Account',
      icon: Icons.edit
  );
 static MenuItem shareItem = MenuItem(
      text: 'Edit Account',
      icon: Icons.share
  );
 static MenuItem logoutItem = MenuItem(
      text: 'Edit Account',
      icon: Icons.logout
  );


}