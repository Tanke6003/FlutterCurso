import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {

  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {

    final  isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer'),
        actions: [
          IconButton(icon:  Icon( !isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined), onPressed: (){
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },)
        ],),
      body: _ThemeChangerView()
      
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColorIndex = ref.watch(themeNotifierProvider).selectedColorIndex;
    
    return ListView.builder(
      //physics: const ClampingScrollPhysics(),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];   
        return RadioListTile(
        title: Text('Color $index',style: TextStyle(color: color),),
        // ignore: deprecated_member_use
        subtitle: Text('Color value ${color.value}'),
        activeColor: color,
        value: index,
        groupValue: selectedColorIndex, 
        onChanged: (value){
       
          ref.read(themeNotifierProvider.notifier).setColor(value!);
        
        });  
    });
  }
}