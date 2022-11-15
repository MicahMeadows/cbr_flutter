import 'package:cbr_flutter/data/repository/ranking/i_ranking_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  final IRankingRepository _repo;

  RankingsCubit(this._repo) : super(RankingsUnloaded());

  Future<void> loadRankings([int? take, int? skip]) async {
    emit(RankingsLoading());
    final newRankings = await _repo.getRankings(take, skip);
    emit(RankingsLoaded(newRankings));
  }
}
