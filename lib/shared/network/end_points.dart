//ignore_for_file: constant_identifier_names
//ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

final String API_KEY = dotenv.env['API_KEY'] ?? 'API_KEY Not Specified';

final String MY_LIST_ID =
    dotenv.env['MY_LIST_ID'] ?? 'MY_LIST_ID Not Specified';

const BASE_POSTER_IMAGE_URL = 'https://image.tmdb.org/t/p/w400';
const BASE_BACKDROP_IMAGE_URL = 'https://image.tmdb.org/t/p/original';
