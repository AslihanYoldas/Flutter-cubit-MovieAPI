import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Constant.dart';
import '../api/movie_api.dart';
import '../model/movie.dart';

class MovieRepository{
  Future<Movie?> fetchPost() async {
    RestClient client=RestClient(Dio(BaseOptions(contentType: 'application/json',headers: {
      'X-RapidAPI-Key': Constant.KEY,
      'X-RapidAPI-Host': Constant.BASE_URL,
    }
     )));
    try{
      Movie data= await client.getPost('game of thrones');
      return data;
    }
    catch(e){
      debugPrint(' Repo ERROR : ${e.toString()}');

    }
  }
}


