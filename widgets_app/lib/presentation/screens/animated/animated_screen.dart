
import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 10;
  double height = 10;
  Color color = Colors.indigo;
  double borderRadius = 10.0;


  void changeShape(){
    final random = Random();

    width = random.nextInt(300).toDouble() + 10;
    height = random.nextInt(300).toDouble() + 10;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    borderRadius = random.nextInt(100).toDouble() ;
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width:width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed :  changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}