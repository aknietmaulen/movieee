class Movie {
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final double rating;

  Movie({required this.id, required this.title, required this.overview, required this.posterPath, required this.rating, });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'],
      overview: json['overview'],
      posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      rating: json['vote_average'].toDouble(),
    );
  }
}
