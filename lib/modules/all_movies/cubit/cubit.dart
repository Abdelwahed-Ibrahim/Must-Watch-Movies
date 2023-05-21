import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/movie_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';

class MoviesCubit extends Cubit<AllMoviesStates> {
  MoviesCubit() : super(AllMoviesInitialState());

  static MoviesCubit get(BuildContext context, [isListening = true]) =>
      BlocProvider.of(context, listen: isListening);

  List<MovieModel> allMovies = [];

  void getAllMovies() {
    emit(GetAllMoviesLoadingState());
    DioHelper.getData(
      path: MY_LIST_ID,
      query: {
        'api_key': API_KEY,
        'language': 'en-US',
      },
    ).then((value) {
      for (var movieJsonData in (value.data['items'] as List)) {
        allMovies.add(MovieModel.fromJson(movieJsonData));
      }
      emit(GetAllMoviesSuccessState());
    }).catchError((error) {
      emit(GetAllMoviesErrorState(error.toString()));
    });
  }
}
