import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/movie_card_item.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Must Watch Movies'),
      ),
      body: BlocProvider(
        create: (context) => MoviesCubit()..getAllMovies(),
        child: BlocConsumer<MoviesCubit, AllMoviesStates>(
          listener: (context, state) {
            if (state is GetAllMoviesErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            MoviesCubit cubit = MoviesCubit.get(context);
            return cubit.allMovies.isNotEmpty
                ? GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 124 / 250,
                    ),
                    itemBuilder: (context, index) =>
                        MovieCardItem(movie: cubit.allMovies[index]),
                    itemCount: cubit.allMovies.length,
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
