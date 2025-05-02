import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);





  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    return datasource.getActorsByMovieId(movieId);
  }


  
}