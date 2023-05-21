import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../models/movie_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Image(
                    image:
                        NetworkImage(movie.backdropPath ?? movie.posterPath!),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Title:',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.title!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Original Title:',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.originalTitle!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Language:',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            movie.originalLanguage!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Overview:',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.overview!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Release Date:',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(DateTime.parse(movie.releaseDate!)),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Ratings:',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircularPercentIndicator(
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
                                      .copyWith(
                                          color: Colors.white, fontSize: 8),
                                ),
                              ],
                            ),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${movie.voteCount.toString()} Votes.',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
