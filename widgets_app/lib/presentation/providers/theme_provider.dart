

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/theme_app.dart';


// only boolean value for dark mode
//final isDarkModeProvider = StateProvider((ref) => false);

// // List of color unmutable colors
 final colorListProvider = Provider((ref) => colorList);

// // only integer index of the color list
// final selectedColorIndexProvider = StateProvider((ref) => 0);

// An Object of ThemeApp that contains the selected color and dark mode
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,ThemeApp>(
  (ref)=> ThemeNotifier()
  );


class ThemeNotifier extends StateNotifier<ThemeApp> {

  // State  =  new ThemeApp()
  ThemeNotifier():super(ThemeApp());

  // change the dark mode value
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  void setColor(int index) {
      state = state.copyWith(selectedColorIndex: index);
  }
  
}