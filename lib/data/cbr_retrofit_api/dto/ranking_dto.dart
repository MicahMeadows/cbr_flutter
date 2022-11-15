import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';

part 'ranking_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RankingDTO {
  final int rank;
  final LocationDTO location;
  const RankingDTO({required this.rank, required this.location});
  factory RankingDTO.fromJson(Map<String, dynamic> json) =>
      _$RankingDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RankingDTOToJson(this);
}
