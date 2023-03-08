import 'package:dio/dio.dart';
import 'package:flutter_movieapi/cubit/movie_cubit.dart';

import 'package:flutter_movieapi/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';

import 'Constant.dart';
import 'api/movie_api.dart';
import 'model/movie.dart';

final locator=GetIt.instance;

void setup(){
  locator.registerLazySingleton<MovieRepository>(() => MovieRepository());
  locator.registerLazySingleton<AppCubit>(() => AppCubit(locator<MovieRepository>()));
  locator.registerLazySingleton<RestClient>(() => RestClient(Dio(BaseOptions(contentType: 'application/json',headers: {
    'X-RapidAPI-Key': Constant.KEY,
    'X-RapidAPI-Host': Constant.BASE_URL,
  }
  )))
  );
  locator.registerFactory<Movie>(() => Movie());

}