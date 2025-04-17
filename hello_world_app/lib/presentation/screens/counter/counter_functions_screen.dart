import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
              //Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtton(icon: Icons.refresh_outlined, onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          }),
          SizedBox(height: 10),
          CustomButtton(icon: Icons.plus_one, onPressed: () {
            setState(() {
              clickCounter++;
            });
          }),
          SizedBox(height: 10),
          CustomButtton(icon: Icons.exposure_minus_1, onPressed: () {
            setState(() {
              if(clickCounter == 0) return;
              clickCounter--;
            });
          },
         // color: Color.fromARGB(255, 255, 0, 0),
         ),
        ],
      ),
    );
  }
}

class CustomButtton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  //final Color? color;

  const CustomButtton({super.key, required this.icon, this.onPressed, 
  //this.color
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      //foregroundColor: Colors.white,
      shape: StadiumBorder(),
      onPressed: onPressed,
      enableFeedback: true,
      child: Icon(icon),
    );
  }
}
