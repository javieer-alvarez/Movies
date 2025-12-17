import 'package:flutter/material.dart';
import 'package:peliculas/search/search.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cinema Movies',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined, color: Colors.white))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas Principales
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              //Slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
                title: 'Popular',
              ),
            ],
          ),
        ));
  }
}
