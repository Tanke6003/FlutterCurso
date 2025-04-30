


import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slide_show_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref){

  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final step2 = ref.watch(moviesSlideShowProvider).isEmpty;
    final step3 = ref.watch(popularMoviesProvider).isEmpty;
    final step4 = ref.watch(topRatedProvider).isEmpty;
    final step5 = ref.watch(upcomingProvider).isEmpty;
  if(step1 ||step2 ||step3||step4||step5) return true;
  return false;
});