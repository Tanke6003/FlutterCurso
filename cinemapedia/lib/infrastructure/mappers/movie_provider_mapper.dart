import 'package:cinemapedia/domain/entities/movie_provider.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/watch_providers_movie_moviedb.dart';

class MovieProviderMapper {
  static MovieProvider castToEntity(Flatrate prov)=>MovieProvider(
    id: prov.providerId,
   name: prov.providerName,
    logoPath: prov.logoPath!=null? 'https://image.tmdb.org/t/p/w500${prov.logoPath}' :'https://thaka.bing.com/th/id/OIP.cfXQqWKoMxdE16J1I6O-vAHaIC?w=199&h=217&c=7&r=0&o=5&pid=1.7',
     order: prov.displayPriority);
}