import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_post_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostRepositoryImpl(videosDataSource: LocalVideoPostDatasource());



    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
        //lazy: false, // this is to load when the references are created  
        create: (_)=> DiscoverProvider(videoRepository:videoPostRepository)..loadNextPag())

      ],
      child: MaterialApp(
        title: 'toktik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor:1).theme(),
        home: DiscoverScreen()
      ),
    );
  }
}
