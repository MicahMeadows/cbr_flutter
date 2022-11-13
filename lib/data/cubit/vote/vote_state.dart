import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';

abstract class VoteState {}

class LoadingState extends VoteState {}

class LoadedState extends VoteState {
  final MatchDTO loadedMatch;

  LoadedState({required this.loadedMatch});
}

class NoMatchFoundState extends VoteState {}
