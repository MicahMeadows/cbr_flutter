import 'package:cbr_flutter/data/model/location.dart';

import './match.dart' show Match;

class MatchResult {
  final Match match;
  final Location winner;
  final Location loser;

  const MatchResult({
    required this.match,
    required this.winner,
    required this.loser,
  });
}
