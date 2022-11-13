// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDTO {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;

  const LocationDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}
