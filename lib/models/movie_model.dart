import '../shared/network/end_points.dart';

class MovieModel {
  late final int? id;
  late final bool? isAdult;
  late final String? backdropPath;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final String? overview;
  late final String? posterPath;
  late final String? releaseDate;
  late final String? title;
  late final double? popularity;
  late final dynamic voteAverage;
  late final int? voteCount;

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdult = json['adult'];
    backdropPath = json['backdrop_path'] != null
        ? BASE_POSTER_IMAGE_URL + json['backdrop_path'].toString()
        : null;
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = BASE_POSTER_IMAGE_URL + json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
