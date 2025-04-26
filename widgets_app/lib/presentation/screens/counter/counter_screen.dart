
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    int counter =  ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with Riverpod'),
        actions: [
          IconButton(icon:  Icon( !isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined), onPressed: (){
            ref.read(isDarkModeProvider.notifier).update((state) => !state);
          },)
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Valor: $counter',style: textStyle),	
            ],
          )
        ],
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            //ref.read(counterProvider.notifier).state++;
            ref.read(counterProvider.notifier).update(( state ) => state + 1 );
        },
        child: const Icon(Icons.add),
      ),
 
      
      
    );
  }
}