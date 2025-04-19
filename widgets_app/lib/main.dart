import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/theme_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp(selectedColorIndex:9).getTheme(),
      home: Scaffold(
        body: Center(
          child: FilledButton(child: Text('Hello World!'),onPressed: () {
            
          },),
        ),
      ),
    );
  }
}
