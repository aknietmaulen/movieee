import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  final String apiKey = '7824ae784e8cac38657b13548128b898';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies(String query, int page) async {
    var url = Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query&page=$page');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movies = (data['results'] as List).where((movieData) => movieData['poster_path'] != null).toList();
      return movies.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchMoviesByCategory(String category) async {
    late Uri url;
    switch (category) {
      case 'popular':
        url = Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
        break;
      case 'now_showing':
        url = Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey');
        break;
      case 'coming_soon':
        url = Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');
        break;
      default:
        throw Exception('Invalid category: $category');
    }

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var movies = (data['results'] as List).where((movieData) => movieData['poster_path'] != null).toList();
      return movies.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies by category');
    }
  }

  Future<Movie> fetchMovieDetails(String id) async {
    var url = Uri.parse('$baseUrl/movie/$id?api_key=$apiKey');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
