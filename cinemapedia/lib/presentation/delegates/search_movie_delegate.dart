

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';


typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {


  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies,required this.initialMovies  });


  void _onQueryChange(String query){
    isLoadingStream.add(true);
    if(_debounceTimer?.isActive?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(microseconds: 500), () async {
      // if(query.isEmpty) {
      //   debouncedMovies.add([]);
      //   return;
      // }
      final movies = await searchMovies(query);
            initialMovies = movies;
      debouncedMovies.add(movies);
      isLoadingStream.add(false);

    });

  }
  void clearStreams(){
    debouncedMovies.close();
  }


  @override
  String get searchFieldLabel =>  'Buscar pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return[
      StreamBuilder( stream: isLoadingStream.stream,
      initialData: false,
       builder: (context, snapshot) {
          if(snapshot.data??false){
            return SpinPerfect(
        duration: const Duration(seconds: 10),
        spins: 10,
        infinite: true,
       
         child:  IconButton(onPressed: ()=> query = "", icon: Icon(Icons.refresh)));
          }
          return FadeIn(
        animate:  query.isNotEmpty,
         child:  IconButton(onPressed: ()=> query = "", icon: Icon(Icons.delete)));
      },)
    
       
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      clearStreams();
      close(context, null);
      
      }, icon: Icon(Icons.arrow_back_rounded));
  }

  Widget buildResultsAndSuggestions(){
    return StreamBuilder(
          initialData: initialMovies,
          stream: debouncedMovies.stream,

          builder: (context, snapshot) {
          final  movies = snapshot.data ?? [];
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return _MovieSearchItem(movie: movies[index], onMovieSelected: (context,movie){
                clearStreams();
                close(context,movie);

              } );
          },);
        },);
  }



  @override
  Widget buildResults(BuildContext context) {
      return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    _onQueryChange(query);
    return buildResultsAndSuggestions();
  }
  
}


class _MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieSearchItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context,movie);
      },
      child: Padding(
        padding:const EdgeInsets.symmetric( horizontal: 10, vertical: 5) ,
        child: Row(
          children: [
            //Image
            SizedBox( width: size.width*.20,child: 
            ClipRRect(
              borderRadius:  BorderRadius.circular(20),
              child: Image.network(movie.posterPath,
              loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child,),
              ),
            ),),
            const SizedBox( width: 10,),
            SizedBox(
              width: size.width *.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,style: textStyles.titleMedium,),
                    (movie.overview.length>100)
                    ? Text('${movie.overview.substring(0,100)}...')
                    : Text(movie.overview),
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded,color: Colors.yellow.shade800,),
                        SizedBox(width: 5,),
                        Text(HumanFormats.humanReadableNumber(movie.voteAverage,1),style:textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),)
                      ],
                    )
                  ],
              ),
            )
      
            //description
          ],
        ),
        ),
    );
  }
}