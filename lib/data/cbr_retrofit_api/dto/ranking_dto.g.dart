// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingDTO _$RankingDTOFromJson(Map<String, dynamic> json) => RankingDTO(
      rank: json['rank'] as int,
      location: LocationDTO.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RankingDTOToJson(RankingDTO instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'location': instance.location.toJson(),
    };
