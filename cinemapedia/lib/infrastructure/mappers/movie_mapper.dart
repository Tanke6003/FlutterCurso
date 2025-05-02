
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieFromMovieDB movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath != '' ?  'https://image.tmdb.org/t/p/w500${movie.backdropPath}': 'no-backDrop' ,
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath != '' ?  'https://image.tmdb.org/t/p/w500${movie.posterPath}': 'no-poster' ,
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
  static Movie movieDetailsDBToEntity(MovieDetails movie)=>Movie(
   adult: movie.adult,
    backdropPath: movie.backdropPath != '' ?  'https://image.tmdb.org/t/p/w500${movie.backdropPath}': 'no-backDrop' ,
    genreIds: movie.genres.map((e) => e.name).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath != '' ?  'https://image.tmdb.org/t/p/w500${movie.posterPath}': 'no-poster' ,
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}