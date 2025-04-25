

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
  MenuItems(
    title: 'Progress Indicators',
    subTitle:'Generales y controlados', 
    link: '/progress',
    icon: Icons.refresh_rounded,  
  ),
  MenuItems(
    title: 'Snackbars & dialogs',
    subTitle:'Snackbars & dialogs', 
    link: '/snackbar',
    icon: Icons.inbox_outlined,  
  ),
  MenuItems(
    title: 'AnimatedContainer',
    subTitle:'Container with animation',
    link: '/animated', 
    icon: Icons.square_outlined,  
  ),

]; // Menu items list 