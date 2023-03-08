
import 'package:flutter/cupertino.dart';
import 'package:flutter_movieapi/model/movie.dart';

import '../repository/MovieRepository.dart';
import 'movie_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubit extends Cubit<AppState>{
  final MovieRepository repository;
  AppCubit(this.repository):super(InitState());

  //Doing API call using repository
  Future<void>fetchMovie() async{
    emit(LoadingState());
    try{
      final response= await repository.fetchPost();
      emit(ResponseState(response!));
    }
    catch(e){
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }

  }

}