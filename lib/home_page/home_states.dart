import 'package:flutter_movieapi/model/movie.dart';

abstract class HomeStates{}

class InitState extends HomeStates{

}

class LoadingState  extends HomeStates{
}
class ErrorState extends HomeStates{
  final String message;
  ErrorState(this.message);

}
//This state responsible for holding the response
class ResponseState extends HomeStates{
  Movie movie;
  ResponseState(this.movie);
}
