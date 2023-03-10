import 'package:flutter/cupertino.dart';
import 'package:flutter_movieapi/description_page/description_states.dart';
import '../repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DescriptionCubit extends Cubit<DescriptionStates>{
  MovieRepository _repository;
  DescriptionCubit(this._repository):super(InitState());

  //Doing API call using repository



  Future<void>fetchMovieDetail(String q) async{
    emit(LoadingState());
    try{
      final response= await _repository.fetchMovieDetail(q);
      emit(ResponseState(response!));
    }
    catch(e){
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }

  }

}