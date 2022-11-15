import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';

abstract class IRankingRepository {
  Future<List<RankingDTO>> getRankings(int? take, int? skip);
}
