
import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(245, 156, 253, 250);
const List<Color> _colorsTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.deepOrange,
  Colors.purple,
  Colors.red,
  Colors.green,
  Colors.yellow,
];



class AppTheme {

  final int selectedColor;

  AppTheme({
  this.selectedColor = 0
  }):assert(selectedColor >= 0 && selectedColor <= _colorsTheme.length-1,'Colors must be between 0 and ${_colorsTheme.length - 1}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsTheme[selectedColor],
      brightness: Brightness.dark,

    );
  }
}