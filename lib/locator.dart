import 'package:dio/dio.dart';
import 'package:flutter_movieapi/repository/movie_repository.dart';
import 'package:get_it/get_it.dart';
import 'constants.dart';
import 'api/movie_api.dart';
import 'description_page/description_cubit.dart';
import 'home_page/home_cubit.dart';

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
    locator.registerLazySingleton<HomeCubit>(() => HomeCubit(locator.get<MovieRepository>()));
    locator.registerLazySingleton<DescriptionCubit>(() => DescriptionCubit(locator.get<MovieRepository>()));
  }
}