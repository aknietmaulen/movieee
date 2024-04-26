// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/movie.dart';
// import 'movie_detail_screen.dart';
// import '../providers/favorite_provider.dart';

// class MovieTile extends StatelessWidget {
//   final Movie movie;

//   const MovieTile({super.key, required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     final isFavorite = Provider.of<FavoriteProvider>(context).isFavorite(movie);
//     return ListTile(
//       leading: Image.network(movie.posterPath),
//       title: Text(movie.title),
//       subtitle: Text(movie.overview),
//       trailing: IconButton(
//         icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.pink),
//         onPressed: () {
//           if (isFavorite) {
//             Provider.of<FavoriteProvider>(context, listen: false).removeFavorite(movie);
//           } else {
//             Provider.of<FavoriteProvider>(context, listen: false).addFavorite(movie);
//           }
//         },
//       ),
//       onTap: () => Navigator.push(context, MaterialPageRoute(
//         builder: (_) => MovieDetailScreen(movieId: movie.id)
//       )),
//     );
//   }
// }
