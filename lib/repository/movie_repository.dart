
import 'package:flutter/cupertino.dart';
import 'package:flutter_movieapi/model/movie_detail.dart';
import '../api/movie_api.dart';
import '../model/movie.dart';

class MovieRepository{

  RestClient _restClient;

  MovieRepository(this._restClient);

  Future<Movie?> fetchMovie(q) async {
    try{
      Movie data= await _restClient.getMovie(q);
      return data;
    }
    catch(e){
      debugPrint(' Movie Repo ERROR : ${e.toString()}');
      return null;
    }
  }
  Future<MovieDetail?> fetchMovieDetail(q) async {
    try{
      MovieDetail data= await _restClient.getMovieDetail(q);
      return data;
    }
    catch(e){
      debugPrint(' Movie Detail Repo ERROR : ${e.toString()}');
      return null;
    }
  }
}


