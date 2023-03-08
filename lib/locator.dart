import 'package:dio/dio.dart';
import 'package:flutter_movieapi/cubit/movie_cubit.dart';
import 'package:flutter_movieapi/repository/MovieRepository.dart';
import 'package:get_it/get_it.dart';
import 'Constant.dart';
import 'api/movie_api.dart';

final locator=GetIt.instance;



class DependencyInjection{

  DependencyInjection(){
    provideApi();
    provideRepositories();
    provideViewModels();
  }
  void provideApi(){
    locator.registerLazySingleton<RestClient>(() => RestClient(Dio(BaseOptions(contentType: 'application/json',headers: {
      'X-RapidAPI-Key': Constant.KEY,
      'X-RapidAPI-Host': Constant.BASE_URL,
    }
    )))
    );
  }

  void provideRepositories(){
    locator.registerLazySingleton<MovieRepository>(() => MovieRepository(locator.get<RestClient>()));
  }

  void provideViewModels(){
    locator.registerLazySingleton<AppCubit>(() => AppCubit(locator.get<MovieRepository>()));
  }
}