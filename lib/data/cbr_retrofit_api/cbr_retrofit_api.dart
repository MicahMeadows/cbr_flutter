import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_result_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'cbr_retrofit_api.g.dart';

@RestApi(baseUrl: 'https://localhost:7078')
abstract class CBRRetrofitAPI {
  factory CBRRetrofitAPI(
    Dio dio, {
    String? baseUrl,
  }) = _CBRRetrofitAPI;

  @GET('/api/Match')
  Future<MatchDTO> getNewMatch();

  @POST('/api/Match')
  Future<void> postMatchResults(@Body() MatchResultDTO matchResult);

  @GET('/api/Ranking')
  Future<List<RankingDTO>> getRankings(int? take, int? skip);
}
