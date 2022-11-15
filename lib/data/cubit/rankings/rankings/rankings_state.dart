import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';

abstract class RankingsState {
  const RankingsState();
}

class RankingsUnloaded extends RankingsState {}

class RankingsLoading extends RankingsState {}

class RankingsLoaded extends RankingsState {
  final List<RankingDTO> loadedRankings;
  const RankingsLoaded(this.loadedRankings);
}

class RankingsError extends RankingsState {}
