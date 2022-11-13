// ignore_for_file: non_constant_identifier_names

import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchDTO {
  final String matchID;
  final LocationDTO redTeam;
  final LocationDTO blueTeam;

  const MatchDTO({
    required this.matchID,
    required this.redTeam,
    required this.blueTeam,
  });

  factory MatchDTO.fromJson(Map<String, dynamic> json) =>
      _$MatchDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MatchDTOToJson(this);
}
