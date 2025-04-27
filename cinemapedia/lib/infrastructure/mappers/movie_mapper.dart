
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieFromMovieDB movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath != '' ?  'https://api.themoviedb.org/t/p/w500${movie.backdropPath}': 'https://placehold.co/500x300' ,
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath != '' ?  'https://api.themoviedb.org/t/p/w500${movie.posterPath}': 'no-poster' ,
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}