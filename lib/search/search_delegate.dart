import 'package:flutter/material.dart';
import 'package:peliculas/providers/providers.dart';

import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  Widget _emptyContainer() {
    return const Center(
        child: Icon(
      Icons.movie_creation_outlined,
      color: Colors.black38,
      size: 140,
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              _MovieSearchSuggeestions(movie: movies[index]),
        );
      },
    );
  }
}

class _MovieSearchSuggeestions extends StatelessWidget {
  final Movie movie;
  const _MovieSearchSuggeestions({required this.movie});

  @override
  Widget build(BuildContext context) {
    final uniKey = movie.heroId = UniqueKey().toString();
    return ListTile(
      leading: Hero(
        tag: uniKey,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImage),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
      title: Text(movie.title),
      subtitle: Text(
        movie.overview,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
