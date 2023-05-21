import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../models/movie_model.dart';
import '../../modules/movie_screen/movie_screen.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class MovieCardItem extends StatelessWidget {
  const MovieCardItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieScreen(movie: movie),
          ),
        );
      },
      child: Card(
        color: kCardColor,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image(image: NetworkImage(movie.posterPath!)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: kPrimaryColor.withOpacity(.7),
                    child: CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 3.0,
                      backgroundColor: Colors.white12,
                      percent: movie.voteAverage / 10,
                      center: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            (movie.voteAverage * 10).toStringAsFixed(0),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '%',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white, fontSize: 8),
                          ),
                        ],
                      ),
                      progressColor: Colors.green,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  movie.title!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: kDefaultStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10),
              child: Center(
                child: Text(
                  DateFormat.yMMMd().format(DateTime.parse(movie.releaseDate!)),
                  textAlign: TextAlign.center,
                  style: kStyleGrey18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
