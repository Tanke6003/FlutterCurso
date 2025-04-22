

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

 const  MenuItems({required this.title, required this.subTitle, required this.link, required this.icon});
}


const List<MenuItems> menuItems = [
  MenuItems(
    title: 'Buttons',
    subTitle:'Various types of buttons',  
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
   MenuItems(
    title: 'Cards',
    subTitle:'Various types of cards', 
    link: '/cards',
    icon: Icons.credit_card_outlined,  
  ),
  // MenuItems(
  //   title: 'Animated',
  //   subTitle:'Animated widgets', 
  //   link: '/animated',
  //   icon: Icons.home_outlined,  
  // ),

]; // Menu items list 