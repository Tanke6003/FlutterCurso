
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            SizedBox(height: 30,),
            Text('circular progress indicator'),
            SizedBox(height: 10,),
            CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.black45),
            SizedBox(height:20,),
            Text('circular y linear progress indicator controlled'),
            SizedBox(height: 10,),
            _ControledProgressIndicator(),
          ],  
      ),
    );
  }
}

class _ControledProgressIndicator extends StatelessWidget {
  const _ControledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value* 2)/100;
      }).takeWhile((value)=>value<100),
      builder:
      (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;
       return Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue, strokeWidth: 2,backgroundColor: Colors.black12),
            const SizedBox(width: 20,),
            Expanded(child: 
              LinearProgressIndicator(
                //strokeWidth: 2,
                value:progressValue,
                backgroundColor: Colors.black12,
              ),
            ),
       
          ],
        ),
      );}
    );
  }
}