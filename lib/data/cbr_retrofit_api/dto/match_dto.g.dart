// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchDTO _$MatchDTOFromJson(Map<String, dynamic> json) => MatchDTO(
      matchID: json['matchID'] as String,
      redTeam: LocationDTO.fromJson(json['redTeam'] as Map<String, dynamic>),
      blueTeam: LocationDTO.fromJson(json['blueTeam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDTOToJson(MatchDTO instance) => <String, dynamic>{
      'matchID': instance.matchID,
      'redTeam': instance.redTeam.toJson(),
      'blueTeam': instance.blueTeam.toJson(),
    };
