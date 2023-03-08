import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi/locator.dart';
import 'package:flutter_movieapi/model/movie.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_states.dart';

class Home extends StatefulWidget {
@override
State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late AppCubit _viewModel;
  //calling fetchuser from cubit
  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => locator.get<AppCubit>(),
      child: Scaffold(
          appBar:AppBar(
            title:Text('Film Uygulaması'),
            backgroundColor: Colors.indigoAccent,
            elevation: 0.0,
          ) ,
          //Bloc Builder will update UI based on state update
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              debugPrint('STATE = ${state}');
              if (state is InitState) {
                _viewModel.fetchMovie();
                return Center(child: const CircularProgressIndicator());
              }
              else if(state is LoadingState){
                return Center(child: const CircularProgressIndicator());
              }
              //Buil UI for API response
              else if (state is ResponseState) {
                final movies = state.posts;
                debugPrint('SUCCESS STATE ');
                return buildListView(movies);
              } else if (state is ErrorState) {
                return Text(state.message);
              } else {
                return Center(child: Text(state.toString()));
              }
            },

          )

      ),
    );
  }

  Widget buildListView(Movie posts) {
    return ListView.builder(
        itemCount:posts.d?.length,
        itemBuilder: (context,index) {
          final post=posts;

          return ListTile(
            title: Text("rank=${post.d![index].l}"),


          );}
    );
  }
}
