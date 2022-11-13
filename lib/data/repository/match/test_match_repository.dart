// import 'dart:async';

// import 'package:cbr_flutter/data/model/match_result.dart';
// import 'package:flutter/material.dart';
// import '../../model/location.dart';
// import '../../model/match.dart' show Match;
// import 'i_match_repository.dart';

// class TestMatchRepository implements IMatchRepository {
//   @override
//   Future<Match> getNewMatch() async {
//     final blueTeam = Location(
//         image: Image.asset('assets/images/vote-image-sample-1.png'),
//         name: 'Wallace Buliding');
//     final redTeam = Location(
//         image: Image.asset('assets/images/vote-image-sample-2.png'),
//         name: 'Alt service building');

//     final newMatch = Match(
//       id: '123',
//       blueTeam: blueTeam,
//       redTeam: redTeam,
//     );

//     return Future.delayed(
//       const Duration(seconds: 1),
//       () => newMatch,
//     );
//   }

//   @override
//   Future<void> postMatchResults(MatchResult result) async {
//     print('${result.winner} won match ${result.match}');
//   }
// }
