// import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';
// import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';
// import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_result_dto.dart';
// import 'package:cbr_flutter/data/model/location.dart';
// import 'package:cbr_flutter/data/model/match.dart';
// import 'package:cbr_flutter/data/model/match_result.dart';
// import 'package:flutter/material.dart';
// import 'package:mapr/mapr.dart';

// import 'mapper.map.dart';

// @MaprBase(objectMaps: [
//   ObjectMap<LocationDTO, Location>(),
//   ObjectMap<MatchDTO, Match>(renameFields: {"MatchID": "id"}),
//   ObjectMap<MatchResultDTO, MatchResult>(),
// ])
// class Mapper extends $Mapper {
//   @override
//   void configure() {
//     // location maps
//     setMap.so.LocationDTO.to.Location.customMap = (srcLocationDTO) {
//       return Location(
//         image: Image.network(srcLocationDTO.ImageURL),
//         name: srcLocationDTO.Name,
//       );
//     };

//     setMap.so.Location.to.LocationDTO.customMap = (srcLocation) {
//       return LocationDTO(
//         ID: '',
//         Name: srcLocation.name,
//         Description: '',
//         ImageURL: '',
//         Rating: 0,
//       );
//     };

//     // match maps
//     setMap.so.Match.to.MatchDTO
//       ..RedTeam = ((srcMatch) => map<Location, LocationDTO>(srcMatch.redTeam))
//       ..BlueTeam =
//           ((srcMatch) => map<Location, LocationDTO>(srcMatch.blueTeam));

//     setMap.so.MatchDTO.to.Match
//       ..blueTeam =
//           ((srcMatchDTO) => map<LocationDTO, Location>(srcMatchDTO.BlueTeam))
//       ..redTeam =
//           ((srcMatchDTO) => map<LocationDTO, Location>(srcMatchDTO.RedTeam));
//   }
// }
