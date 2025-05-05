

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movie_provider_datasource.dart';
import 'package:cinemapedia/domain/entities/movie_provider.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_provider_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/watch_providers_movie_moviedb.dart';
import 'package:dio/dio.dart';

class  MovieProviderMoviedbDatasource  extends MovieProviderDatasource{
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Environment.tmdbKey,
          'language': 'es-MX',
        }

      )
    );

  @override
  Future<List<MovieProvider>> getProvidersByMovieId(String movieId) async {
    
      final response = await dio.get('movie/$movieId/watch/providers');
      //if(response.statusCode!=200)throw Exception('cats for movie with id:$movieId not found');
      var providers =[];
      if(response.data.result["MX"])
      {
        providers  = WatchProvidersResponse.fromJson(response.data.result["MX"]) as List<MovieProvider>;
      }
    
        
      return providers.map((prov)=>MovieProviderMapper.castToEntity(prov)).toList();
  }


  
}