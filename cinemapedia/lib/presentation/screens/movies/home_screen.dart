

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {

  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _HomeView(),
      bottomNavigationBar:CustomBottomNavigationbar(),
     
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  
  @override
  void initState() {
  
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();


  }

  @override
  void dispose() {

    super.dispose();
        ref.read(nowPlayingMoviesProvider.notifier).dispose();
  }
  @override
  Widget build(BuildContext context) {

    // final moviesPlayingNow = ref.watch(nowPlayingMoviesProvider);
    final moviesPlayingNow = ref.watch(moviesSlideShowProvider);


    return  Column(children: [
      CustomAppbar(),
      MoviesSlideShow(movies: moviesPlayingNow )
      // Expanded(
      //   child: ListView.builder(
      //   itemCount: movies.length,
      //   itemBuilder: (context, index) {
      //     final movie = movies[index];
      //     return ListTile(
      //       title: Text(movie.title),
        
      //   );
        
      //       },),
      // )
    ],);
  }
}