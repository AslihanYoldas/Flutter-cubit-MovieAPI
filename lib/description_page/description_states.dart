import 'package:flutter_movieapi/model/movie.dart';
import 'package:flutter_movieapi/model/movie_detail.dart';

abstract class DescriptionStates{}

class InitState extends DescriptionStates{

}

class LoadingState  extends DescriptionStates{
}
class ErrorState extends DescriptionStates{
  final String message;
  ErrorState(this.message);

}
//This state responsible for holding the response
class ResponseState extends DescriptionStates{
  MovieDetail movie_det;
  ResponseState(this.movie_det);
}
