import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi/home_page/home_cubit.dart';
import 'package:flutter_movieapi/home_page/home_states.dart';
import 'package:flutter_movieapi/locator.dart';
import 'package:flutter_movieapi/model/movie.dart';

import 'description_view.dart';

class HomeView extends StatefulWidget {
@override
State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  late HomeCubit _home_view_model;
  TextEditingController editingController = TextEditingController();

  //calling fetchuser from home_page
  @override
  void initState() {
    super.initState();
    _home_view_model = locator.get<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (c) => _home_view_model,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Film Uygulaması'),
            backgroundColor: Colors.indigoAccent,
            elevation: 0.0,
          ),
          //Bloc Builder will update UI based on state update
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                TextField(
                 // onChanged: (value) => _home_view_model.fetchMovie(value),
                  onSubmitted: (value) => _home_view_model.fetchMovie(value),
                  controller: editingController,
                  decoration: const InputDecoration(
                    labelText: "Search movies",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
                  debugPrint('STATE = ${state}');
                  if (state is InitState) {
                    //_home_view_model.fetchMovie('');
                  } else if (state is LoadingState) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  //Buil UI for API response
                  else if (state is ResponseState) {
                    final movies = state.movie;
                    debugPrint('SUCCESS STATE ');
                    return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movies.d?.length,
                        itemBuilder: (context, index) {
                          final post = movies;

                          return InkWell(
                            onTap: () {
                              String id = (movies.d![index].id!);
                              print("Response State " + id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DescriptionView(id)));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              title: Text(
                                "${post.d![index].l}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '${post.d![index].y}',
                                style: TextStyle(color: Colors.black54),
                              ),
                              trailing: Text(
                            ' ${post.d![index].s}',
                            style: TextStyle(color: Colors.amber),
                          ),
                              leading: Image.network(
                                  "${post.d![index].i?.imageUrl}"),
                            ),
                          );
                        });
                  } else if (state is ErrorState) {
                    //return Text(state.message);
                  } else {
                    return Center(child: Text(" "));
                  }
                  return Center(child: Text(" "));
                })
              ]),
            ),
          ),
        ));
  }
}