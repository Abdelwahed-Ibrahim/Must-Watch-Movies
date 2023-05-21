import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'modules/all_movies/all_movies_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // await FlutterConfig.loadEnvVariables();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Must Watch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kDefaultColor,
        appBarTheme:
            AppBarTheme.of(context).copyWith(backgroundColor: kPrimaryColor),
        scaffoldBackgroundColor: kColor,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const AllMoviesScreen(),
    );
  }
}
