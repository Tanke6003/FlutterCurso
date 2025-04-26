import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.brown,
  Colors.grey,
];

class ThemeApp {
  final int selectedColorIndex;
  final bool isDarkMode;

  ThemeApp({this.selectedColorIndex = 0,
  this.isDarkMode = false})

    : assert(
        selectedColorIndex >= 0 && selectedColorIndex < colorList.length,
        'selectedColorIndex must be between 0 and ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColorIndex],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );
  ThemeApp copyWith({
    int? selectedColorIndex,
    bool? isDarkMode,
  }) =>  ThemeApp(
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  
}
