

import 'package:flutter/material.dart';


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
  MenuItems(title: 'UI-Controls',
   subTitle: 'Various types of UI controls',
    link: '/ui-controls',
    icon: Icons.control_camera_outlined,
    ),
  MenuItems(
    title:'tutorial',
    subTitle: 'example of tutorial',
    link: '/tutorial',
    icon: Icons.tour_outlined,
  ),
  MenuItems(
    title: 'Infinite Scroll',
    subTitle: 'Example of infinite scroll',
    link: '/infinite-scroll',
    icon: Icons.arrow_circle_down_outlined,
    )

]; // Menu items list 