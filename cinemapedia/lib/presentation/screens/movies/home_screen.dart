import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedProvider.notifier).loadNextPage();
    ref.read(upcomingProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(nowPlayingMoviesProvider.notifier).dispose();
    ref.read(popularMoviesProvider.notifier).dispose();
    ref.read(topRatedProvider.notifier).dispose();
    ref.read(upcomingProvider.notifier).dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();
    final moviesPlayingNow = ref.watch(nowPlayingMoviesProvider);
    final moviesSlide = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedProvider);
    final upComingMovies = ref.watch(upcomingProvider);



    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              alignment: Alignment.center, // Centra el contenido
              child: const CustomAppbar(), // Tu widget personalizado
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                //CustomAppbar(),
                MoviesSlideShow(movies: moviesSlide),
                MovieHorizontalListview(
                  movies: moviesPlayingNow,
                  title: 'En cines',
                  subtitle: HumanFormats.getDateWithDayNameAndNumber(DateTime.now()),

                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: upComingMovies,
                  title: 'Proximamente',
                  subtitle: HumanFormats.getDateWithDayNameAndNumber(DateTime.now()),
                  loadNextPage:
                      () => ref.read(upcomingProvider.notifier).loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',

                  loadNextPage:
                      () =>
                          ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor Calificadas',

                  loadNextPage:
                      () => ref.read(topRatedProvider.notifier).loadNextPage(),
                ),
                SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
