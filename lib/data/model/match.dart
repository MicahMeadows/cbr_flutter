import 'location.dart';

class Match {
  final String id;
  final Location redTeam;
  final Location blueTeam;

  const Match({
    required this.id,
    required this.redTeam,
    required this.blueTeam,
  });
}
