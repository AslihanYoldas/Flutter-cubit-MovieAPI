import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/movie.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: 'https://imdb8.p.rapidapi.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/auto-complete")
  Future<Movie> getPost( @Query('q') String query);
}

List<Movie> postFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String postToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));