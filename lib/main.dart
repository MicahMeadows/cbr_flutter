import 'package:cbr_flutter/data/cbr_retrofit_api/cbr_retrofit_api.dart';
import 'package:cbr_flutter/data/cubit/vote/vote_cubit.dart';
import 'package:cbr_flutter/data/repository/match/cbr_api_match_repository.dart';
import 'package:cbr_flutter/data/repository/match/i_match_repository.dart';
import 'package:cbr_flutter/widget/main_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:5029'));
  late final api = CBRRetrofitAPI(dio, baseUrl: 'http://localhost:5029');
  late final IMatchRepository matchRepo = CBRAPIMatchRepository(api);

  late final voteCubit = VoteCubit(matchRepo)..loadMatch();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => voteCubit),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainNavigation(),
      ),
    );
  }
}
