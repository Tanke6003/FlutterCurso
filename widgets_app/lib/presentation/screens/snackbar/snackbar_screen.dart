
import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    var customSnackbar = SnackBar(
        content: const Text('This is a custom snackbar'),
        action: SnackBarAction(label: 'ok',onPressed: () {
          
        },),
        duration: const Duration(seconds: 2),
        //backgroundColor: Colors.red,
        
      );
    ScaffoldMessenger.of(context).showSnackBar(customSnackbar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar & dialogs screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=>
       showCustomSnackbar(context), label: const Text('Show snackbar'),icon: Icon(Icons.remove_red_eye_outlined),),


    );
  }
}