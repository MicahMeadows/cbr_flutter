// ignore_for_file: non_constant_identifier_names

import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_result_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchResultDTO {
  final String matchID;
  final LocationDTO winner;
  final LocationDTO loser;

  const MatchResultDTO({
    required this.matchID,
    required this.winner,
    required this.loser,
  });

  Map<String, dynamic> toJson() => _$MatchResultDTOToJson(this);
}
