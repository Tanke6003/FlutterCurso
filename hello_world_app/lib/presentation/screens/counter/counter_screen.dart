import 'package:flutter/material.dart';

class CounterSreen extends StatefulWidget {


  const CounterSreen({super.key});

  @override
  State<CounterSreen> createState() => _CounterSreenState();
}








class _CounterSreenState extends State<CounterSreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Counter Screen'),
        centerTitle: true,
      ),
        body: Center( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',style: TextStyle(fontSize: 160,fontWeight: FontWeight.w100),),
            Text( 'Click${clickCounter == 1? '':'s'}',style: TextStyle(fontSize:25))
          ],
        ),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
            setState(() {
              clickCounter++;
            });
          },
          child: const Icon(Icons.plus_one),
        ),
      );
  }
}