import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Constant.dart';
import '../api/movie_api.dart';
import '../locator.dart';
import '../model/movie.dart';

class MovieRepository{
  Future<Movie?> fetchPost() async {
    try{
      Movie data= await locator.get<RestClient>().getPost('game of thrones');
      return data;
    }
    catch(e){
      debugPrint(' Repo ERROR : ${e.toString()}');

    }
  }
}


