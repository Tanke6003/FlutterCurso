import 'package:cinemapedia/domain/datasources/movie_provider_datasource.dart';
import 'package:cinemapedia/domain/entities/movie_provider.dart';
import 'package:cinemapedia/domain/repositories/movie_provider_repository.dart';

class MovieProviderRepositoryImpl  extends MovieProviderRepository {

  MovieProviderDatasource datasource;

  MovieProviderRepositoryImpl(this.datasource);






  
  @override
  Future<List<MovieProvider>> getProvidersByMovieId(String movieId) {
    return datasource.getProvidersByMovieId(movieId);
  }


  
}