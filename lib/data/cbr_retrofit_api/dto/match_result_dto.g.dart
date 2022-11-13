// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResultDTO _$MatchResultDTOFromJson(Map<String, dynamic> json) =>
    MatchResultDTO(
      matchID: json['matchID'] as String,
      winner: LocationDTO.fromJson(json['winner'] as Map<String, dynamic>),
      loser: LocationDTO.fromJson(json['loser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchResultDTOToJson(MatchResultDTO instance) =>
    <String, dynamic>{
      'matchID': instance.matchID,
      'winner': instance.winner.toJson(),
      'loser': instance.loser.toJson(),
    };
