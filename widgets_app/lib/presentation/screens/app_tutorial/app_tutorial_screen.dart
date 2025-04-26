
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';




final List<SlideInfo> sildes = [
  const SlideInfo(
    title: 'Welcome to Flutter',
    caption: 'This is a tutorial app',
    imageUrl: 'assets/images/1.png',
  ),
  const SlideInfo(
    title: 'Learn Flutter',
    caption: 'Learn how to build apps with Flutter',
    imageUrl: 'assets/images/2.png',
  ),
  const SlideInfo(
    title: 'Build Beautiful Apps',
    caption: 'Build beautiful apps with Flutter and Dart',
    imageUrl: 'assets/images/3.png',
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  //final Color color;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
    //required this.color,
  });
}

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
   
    super.initState();
    pageViewController.addListener((){
      final page = pageViewController.page ?? 0;
      if( !endReached && page >= (sildes.length - 1.5) ){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose the page controller to free up resources and avoid memory leaks
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: sildes.map(
              (slideData) => _Slide(slideInfo: slideData),
            ).toList(),
          ),
          
          Positioned(right: 20,
          top:50, child: TextButton(onPressed: ()=>context.pop(), child: const Text('Skip'))),
          endReached ? Positioned(bottom: 60,
          right: 30,child: 
          FadeInRight(
            from: 15,
            delay: Duration(microseconds: 400),
            child: FilledButton(onPressed: ()=>context.pop(), child:  Text('Start'))),
          ): SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final SlideInfo slideInfo;
  const _Slide( {required this.slideInfo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final titleStyle = theme.titleLarge;
    final captionStyle = theme.bodySmall;



    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slideInfo.imageUrl)),
            SizedBox(height: 20),
            Text(
              slideInfo.title,
              style: titleStyle
            ),
            const SizedBox(height: 10),
            Text(
              slideInfo.caption,
              style: captionStyle,
             
            ),
          ],
        ),
      ),
    
    
    )
    ;
  }
}