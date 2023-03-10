import 'dart:convert';
import 'package:flutter_movieapi/model/movie_detail.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/movie.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: 'https://imdb8.p.rapidapi.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/auto-complete")
  Future<Movie> getMovie( @Query('q') String query);
  @GET("/title/get-overview-details")
  Future<MovieDetail> getMovieDetail( @Query('tconst') String query);

}

List<Movie> postFromJsonMovie(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String postToJsonMovie(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MovieDetail> postFromJsonMovieDetail(String str) =>
    List<MovieDetail>.from(json.decode(str).map((x) => MovieDetail.fromJson(x)));

String postToJsonMovieDetail(List<MovieDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));