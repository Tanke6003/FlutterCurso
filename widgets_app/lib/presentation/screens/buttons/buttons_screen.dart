

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body:_bottonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
          //Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      )
    );
  }
}

class _bottonsView extends StatelessWidget {
  const _bottonsView();

  @override
  Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          spacing:  5,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(child: const Text('Elevanted'),onPressed: () {
              
            }, ),
            const ElevatedButton(child: const Text('Elevanted Disabled'),onPressed:null),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            FilledButton.icon(onPressed: (){}, label: const Text('Filled Icon'), icon: const Icon(Icons.accessibility_new),),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.track_changes),
              label: const Text('Outlined Icon'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_comment),
              label: const Text('Text Icon'),
            ),
            const CustomBottom(),
            IconButton(onPressed: (){}, icon:Icon(Icons.add_circle_rounded),),
            IconButton(onPressed: (){}, icon:Icon(Icons.add_circle_outline), style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.primary),
            iconColor: WidgetStatePropertyAll(colors.onPrimary),
            ),),
          
          ],    
        ),
      ),
    );
  }
}
class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo',style:TextStyle(color:Colors.white),)
          
          ),
        ),
      ),
    );
  }
}