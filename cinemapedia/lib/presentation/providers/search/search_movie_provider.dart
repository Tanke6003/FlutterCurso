import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searcheMovieProvider =
    StateNotifierProvider<SearchMovieNotifier, List<Movie>>((ref) {
      final moviesRepository = ref.read(movieRepositoryProvider);
      return SearchMovieNotifier(
        searchMovies: moviesRepository.searchMovies,
        ref: ref,
      );
    });

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchMovieNotifier({required this.searchMovies, required this.ref})
    : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
