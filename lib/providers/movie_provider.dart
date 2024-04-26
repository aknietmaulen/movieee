import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      return await _apiService.fetchMoviesByCategory('popular');
    } catch (e) {
      throw Exception('Failed to fetch popular movies: $e');
    }
  }

  Future<List<Movie>> fetchNowShowingMovies() async {
    try {
      return await _apiService.fetchMoviesByCategory('now_showing');
    } catch (e) {
      throw Exception('Failed to fetch now showing movies: $e');
    }
  }

  Future<List<Movie>> fetchComingSoonMovies() async {
    try {
      return await _apiService.fetchMoviesByCategory('coming_soon');
    } catch (e) {
      throw Exception('Failed to fetch coming soon movies: $e');
    }
  }
  
  Future<List<Movie>> fetchMoviesByTitle(String query, int page) async {
    try {
      return await _apiService.fetchMovies(query, page);
    } catch (e) {
      throw Exception('Failed to fetch movies by title: $e');
    }
  }
}
