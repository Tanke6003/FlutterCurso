

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/theme_app.dart';
//
final isDarkModeProvider = StateProvider((ref) => false);

// List of color unmutable colors
final colorListProvider = Provider((ref) => colorList);


final selectedColorIndexProvider = StateProvider((ref) => 0);