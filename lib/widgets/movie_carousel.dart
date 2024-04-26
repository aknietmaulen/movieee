import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';
import '../views/movie_detail_screen.dart';

class MovieCarousel extends StatelessWidget {
  final String category;

  const MovieCarousel({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            _getCategoryTitle(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,),
          ),
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder<List<Movie>>(
            future: _fetchMovies(movieProvider),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final movies = snapshot.data;
                if (movies != null && movies.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return _buildMovieCard(context, movie); // Pass context
                    },
                  );
                } else {
                  return Center(child: Text('No movies available'));
                }
              }
            },
          ),
        ),
      ],
    );
  }

  String _getCategoryTitle() {
    switch (category) {
      case 'Popular':
        return 'Trending Movies';
      case 'Now Showing':
        return 'Now Playing Movies';
      case 'Coming Soon':
        return 'Upcoming Movies';
      default:
        return '';
    }
  }

  Future<List<Movie>> _fetchMovies(MovieProvider movieProvider) async {
    try {
      switch (category) {
        case 'Popular':
          return await movieProvider.fetchPopularMovies();
        case 'Now Showing':
          return await movieProvider.fetchNowShowingMovies();
        case 'Coming Soon':
          return await movieProvider.fetchComingSoonMovies();
        default:
          return [];
      }
    } catch (e) {
      throw Exception('Failed to fetch $category movies: $e');
    }
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                movie.posterPath,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 150,
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
