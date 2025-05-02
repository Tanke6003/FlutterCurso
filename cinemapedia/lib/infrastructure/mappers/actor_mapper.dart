
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast)=>Actor(
    id: cast.id,
   name: cast.name,
    profilePath: cast.profilePath!=null? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' :'https://thaka.bing.com/th/id/OIP.cfXQqWKoMxdE16J1I6O-vAHaIC?w=199&h=217&c=7&r=0&o=5&pid=1.7',
     character: cast.character);
}