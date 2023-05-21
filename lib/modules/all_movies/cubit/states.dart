

abstract class AllMoviesStates {}

class AllMoviesInitialState extends AllMoviesStates {}

class GetAllMoviesLoadingState extends AllMoviesStates {}

class GetAllMoviesSuccessState extends AllMoviesStates {}

class GetAllMoviesErrorState extends AllMoviesStates {
  final String error;

  GetAllMoviesErrorState(this.error);
}
