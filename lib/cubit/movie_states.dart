import 'package:flutter_movieapi/model/movie.dart';

import '../locator.dart';



abstract class AppState{}

class InitState extends AppState{

}

class LoadingState  extends AppState{
}
class ErrorState extends AppState{
  final String message;
  ErrorState(this.message);

}
//This state responsible for holding the response
class ResponseState extends AppState{
  Movie posts=locator<Movie>();
  ResponseState(this.posts);
}
