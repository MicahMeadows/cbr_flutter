import 'package:cbr_flutter/data/cbr_retrofit_api/cbr_retrofit_api.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_cubit.dart';
import 'package:cbr_flutter/data/cubit/vote/vote_cubit.dart';
import 'package:cbr_flutter/data/repository/match/cbr_api_match_repository.dart';
import 'package:cbr_flutter/data/repository/match/i_match_repository.dart';
import 'package:cbr_flutter/data/repository/ranking/cbr_api_ranking_repository.dart';
import 'package:cbr_flutter/data/repository/ranking/i_ranking_repository.dart';
import 'package:cbr_flutter/widget/main_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:5029'));
  late final _api = CBRRetrofitAPI(dio, baseUrl: 'http://localhost:5029');

  late final IMatchRepository matchRepo = CBRAPIMatchRepository(_api);
  late final IRankingRepository rankingRepo = CBRAPIRankingRepository(_api);

  late final voteCubit = VoteCubit(matchRepo)..loadMatch();
  late final rankingCubit = RankingsCubit(rankingRepo)..loadRankings();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => voteCubit, lazy: false),
        BlocProvider(create: (ctx) => rankingCubit, lazy: false),
      ],
      child: MaterialApp(
        scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainNavigation(),
      ),
    );
  }
}
