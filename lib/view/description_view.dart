import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi/description_page/description_cubit.dart';
import 'package:flutter_movieapi/repository/movie_repository.dart';

import '../description_page/description_states.dart';
import '../locator.dart';


class DescriptionView extends StatefulWidget {
String id;
DescriptionView(this.id, {super.key});

  @override
  State<DescriptionView> createState() => _DescriptionViewState(this.id);
}

class _DescriptionViewState extends State<DescriptionView> {
  String id;
  //late DescriptionCubit _desc_view_model;

  _DescriptionViewState(this.id);

  @override
  void initState() {
    super.initState();
    //_desc_view_model = locator.get<DescriptionCubit>();

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => DescriptionCubit(locator.get<MovieRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Film Uygulaması'),
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<DescriptionCubit, DescriptionStates>(
            builder: (context, state) {
          debugPrint('STATE = ${state}');
          if (state is InitState) {
            BlocProvider.of<DescriptionCubit>(context).fetchMovieDetail(id);
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());

          } else if (state is ResponseState) {
            final movie_det = state.movie_det;
            debugPrint('SUCCESS STATE ');
            return Container(
                child: ListView(
              children: [
                Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          height: 250.0,
                          width: movie_det.title!.image!.width!.toDouble(),
                          child: Center(
                              child: Image.network(
                            movie_det.title!.image!.url!,
                            fit: BoxFit.cover,
                          )),
                        )),
                        Positioned(
                          bottom: 10,
                          child: Text("\u{2730}${movie_det.ratings!.rating!}",
                              style: const TextStyle(
                                  color: Colors.amber, fontSize: 20.0)),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      movie_det.title!.title! ?? 'Not Loaded',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(movie_det.genres!.join(" "),
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text('${movie_det.title!.year!}',
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                      '${movie_det.title!.runningTimeInMinutes!} minutes',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(movie_det.plotOutline!.text!,
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                )
              ],
            ));
          } else if (state is ErrorState) {
            //return Text(state.message);
          } else {
            return const Center(child: Text(" "));
          }
          return const Center(child: Text(" "));
        }),
      ),
    );
  }
}
