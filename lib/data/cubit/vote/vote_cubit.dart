import 'dart:collection';
import 'dart:html';
import 'dart:math';

import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_result_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cbr_retrofit_api/dto/location_dto.dart';
import '../../cbr_retrofit_api/dto/match_dto.dart';
import '../../repository/match/i_match_repository.dart';
import 'vote_state.dart';

class VoteCubit extends Cubit<VoteState> {
  final IMatchRepository _matchRepository;

  VoteCubit(this._matchRepository) : super(LoadingState());
  var matchQueue = Queue<MatchDTO>();
  static const _minQueueTarget = 3;

  Future<void> loadMatch() async {
    if (matchQueue.isEmpty) {
      emit(LoadingState());
      await loadNMatches(1);
      if (matchQueue.isEmpty) {
        emit(NoMatchFoundState());
      }
    }
    if (matchQueue.isNotEmpty) {
      final match = matchQueue.first;
      emit(LoadedState(loadedMatch: match));
      matchQueue.remove(match);
      int numToLoad = max(0, _minQueueTarget - matchQueue.length);
      await loadNMatches(numToLoad);
    }
  }

  Future<void> loadAndAddMatch() async {
    final newMatch = await _matchRepository.getNewMatch();
    matchQueue.add(newMatch);
    print('match count: ${matchQueue.length}');
  }

  Future<void> loadNMatches(int n) async {
    List<Future> tasks = [];
    for (int i = 0; i < n; i++) {
      final task = loadAndAddMatch();
      tasks.add(task);
    }
    await Future.wait(tasks);
  }

  void submitMatch(MatchDTO match, LocationDTO winner) async {
    final loadMatchTask = loadMatch();
    final loser =
        match.redTeam.id == winner.id ? match.blueTeam : match.redTeam;

    final newResults =
        MatchResultDTO(matchID: match.matchID, winner: winner, loser: loser);

    final postTask = _matchRepository.postMatchResults(newResults);

    Future.wait([
      loadMatchTask,
      postTask,
    ]);
  }
}
