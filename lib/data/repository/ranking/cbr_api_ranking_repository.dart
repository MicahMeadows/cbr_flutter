import 'package:cbr_flutter/data/cbr_retrofit_api/cbr_retrofit_api.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';
import 'package:cbr_flutter/data/repository/ranking/i_ranking_repository.dart';

class CBRAPIRankingRepository implements IRankingRepository {
  final CBRRetrofitAPI _api;
  const CBRAPIRankingRepository(this._api);
  @override
  Future<List<RankingDTO>> getRankings(int? take, int? skip) {
    return _api.getRankings(take, skip);
  }
}
