
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  void openDialog(BuildContext context){
    showDialog(context: context,
    barrierDismissible: false // to prevent closing the dialog by tapping outside of it
    , builder: 

    (context)=> AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Et enim id dolor velit anim adipisicing mollit ea elit eiusmod duis mollit adipisicing. Ullamco dolore culpa cupidatat adipisicing occaecat. Eiusmod ut do ex laboris elit.'),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child: Text('Cancel')),
        FilledButton(onPressed: (){
            context.pop();
          }, child: Text('Ok')),
        ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar & dialogs screen'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(onPressed: ()
          {
              showAboutDialog(context: context,
              children: [
                const Text('Id Lorem pariatur incididunt incididunt laboris magna reprehenderit. Culpa labore est minim dolor adipisicing esse aliqua et aliquip labore magna eu reprehenderit. Ex pariatur voluptate enim reprehenderit occaecat cillum consectetur.'),
               
              
              ]);
          }, child: Text('Licenses used'))  ,
          FilledButton.tonal(onPressed: ()
          {
            openDialog(context);
          }, child: Text('Show dialog')), 

        ],
      ),),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=>
       showCustomSnackbar(context), label: const Text('Show snackbar'),icon: Icon(Icons.remove_red_eye_outlined),),


    );
  }
}