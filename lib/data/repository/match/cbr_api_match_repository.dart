import 'package:cbr_flutter/data/cbr_retrofit_api/cbr_retrofit_api.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_result_dto.dart';
import 'package:cbr_flutter/data/repository/match/i_match_repository.dart';

class CBRAPIMatchRepository implements IMatchRepository {
  final CBRRetrofitAPI api;
  const CBRAPIMatchRepository(this.api);

  @override
  Future<MatchDTO> getNewMatch() {
    return api.getNewMatch();
  }

  @override
  Future<void> postMatchResults(MatchResultDTO result) {
    return api.postMatchResults(result);
  }
}
