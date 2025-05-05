import 'package:cinemapedia/domain/entities/movie_provider.dart';

abstract class MovieProviderDatasource {
  Future<List<MovieProvider>> getProvidersByMovieId(String movieId );

}
