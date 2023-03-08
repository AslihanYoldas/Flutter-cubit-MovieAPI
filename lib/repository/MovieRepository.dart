
import 'package:flutter/cupertino.dart';
import '../api/movie_api.dart';
import '../model/movie.dart';

class MovieRepository{

  RestClient _restClient;

  MovieRepository(this._restClient);

  Future<Movie?> fetchPost() async {
    try{
      Movie data= await _restClient.getPost('game of thrones');
      return data;
    }
    catch(e){
      debugPrint(' Repo ERROR : ${e.toString()}');
      return null;
    }
  }
}


