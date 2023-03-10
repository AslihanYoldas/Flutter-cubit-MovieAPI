
import 'package:flutter/cupertino.dart';
import '../repository/movie_repository.dart';
import 'home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeStates>{
  MovieRepository _repository;
  HomeCubit(this._repository):super(InitState());

  //Doing API call using repository
  Future<void>fetchMovie(String q) async{
    emit(LoadingState());
    try{
      final response= await _repository.fetchMovie(q);
      emit(ResponseState(response!));
    }
    catch(e){
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }

  }


  }

