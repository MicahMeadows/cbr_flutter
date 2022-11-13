import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_result_dto.dart';

abstract class IMatchRepository {
  Future<MatchDTO> getNewMatch();
  Future<void> postMatchResults(MatchResultDTO result);
}
